package cn.elvea.persistence.service;

import cn.elvea.core.persistence.repository.BaseRepository;
import cn.elvea.core.persistence.repository.support.NativeWork;
import cn.elvea.core.persistence.repository.support.ReturningNativeWork;
import cn.elvea.core.persistence.repository.support.ReturningWork;
import cn.elvea.core.persistence.repository.support.Work;
import cn.elvea.core.service.BaseEntityService;
import cn.elvea.core.utils.JdbcUtils;
import cn.elvea.entity.User;
import cn.elvea.persistence.repository.UserRepository;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserService extends BaseEntityService<User, Long> {
    @Autowired
    UserRepository userRepository;

    @Override
    protected BaseRepository getRepository() {
        return userRepository;
    }

    public long testWork() throws SQLException {
        userRepository.execute((Work) entityManager -> {
            User user = new User();
            user.setUsername(String.valueOf(new Date().getTime()));

            entityManager.persist(user);
        });

        return userRepository.execute((ReturningWork<Long>) entityManager -> {
            Query query = entityManager.createQuery(" select count(id) from User ");
            return (Long) query.getSingleResult();
        });
    }

    public int testNativeWork() throws SQLException {
        userRepository.execute((NativeWork) con -> {
            PreparedStatement stmt = null;
            try {
                stmt = con.prepareStatement(" insert into users (username) values (?)");
                stmt.setString(1, String.valueOf(new Date().getTime()));
                stmt.executeUpdate();
            } finally {
                JdbcUtils.close(stmt);
            }
        });

        return userRepository.execute((ReturningNativeWork<Integer>) con -> {
            ResultSet rs = null;
            PreparedStatement stmt = null;
            try {
                stmt = con.prepareStatement(" select count(id) cnt from users ");
                rs = stmt.executeQuery();
                if (rs.next()) {
                    return rs.getInt("cnt");
                }
            } finally {
                JdbcUtils.close(rs);
                JdbcUtils.close(stmt);
            }
            return 0;
        });
    }

    public int testCreateSimpleTempTable() throws SQLException {
        List<Long> data = Lists.newArrayList();
        data.add(1l);
        data.add(2l);
        data.add(3l);

        String tmpTableName = null;
        try {
            tmpTableName = userRepository.createTempTable(data);

            final String temporaryTableName = tmpTableName;
            return userRepository.execute((ReturningNativeWork<Integer>) con -> {
                ResultSet rs = null;
                PreparedStatement stmt = null;
                try {
                    stmt = con.prepareStatement(" select count(id) cnt from " + temporaryTableName);
                    rs = stmt.executeQuery();
                    if (rs.next()) {
                        return rs.getInt("cnt");
                    }
                } finally {
                    JdbcUtils.close(rs);
                    JdbcUtils.close(stmt);
                }
                return 0;
            });
        } finally {
            userRepository.dropTemporaryTable(tmpTableName);
        }
    }

    public int testCreateTempTable() throws SQLException {
        Map<String, String> nameTypeMap = Maps.newHashMap();
        nameTypeMap.put("username", JdbcUtils.COL_TYPE_STRING);
        nameTypeMap.put("birthday", JdbcUtils.COL_TYPE_DATE);
        nameTypeMap.put("logindatetime", JdbcUtils.COL_TYPE_TIMESTAMP);
        nameTypeMap.put("cradit_1", JdbcUtils.COL_TYPE_DOUBLE);
        nameTypeMap.put("cradit_2", JdbcUtils.COL_TYPE_FLOAT);
        nameTypeMap.put("cradit_3", JdbcUtils.COL_TYPE_INTEGER);

        List<Map<String, Object>> data = Lists.newArrayList();
        for (int i = 0; i <= 100; i++) {
            Map<String, Object> row = Maps.newHashMap();
            row.put("username", String.valueOf(new Date().getTime()));
            row.put("birthday", new Timestamp(new Date().getTime()));
            row.put("logindatetime", new Timestamp(new Date().getTime()));
            row.put("cradit_1", 1.23f);
            row.put("cradit_2", 4.567f);
            row.put("cradit_3", 88);

            data.add(row);
        }

        String tmpTableName = null;
        try {
            tmpTableName = userRepository.createTempTable(nameTypeMap, data);

            final String temporaryTableName = tmpTableName;

            return userRepository.execute((ReturningNativeWork<Integer>) con -> {
                int cnt = 0;

                ResultSet rs = null;
                PreparedStatement stmt = null;
                try {
                    stmt = con.prepareStatement(" select count(*) cnt from " + temporaryTableName);
                    rs = stmt.executeQuery();
                    if (rs.next()) {
                        cnt = rs.getInt("cnt");
                    }
                } finally {
                    JdbcUtils.close(rs);
                    JdbcUtils.close(stmt);
                }
                return cnt;
            });
        } finally {
            userRepository.dropTemporaryTable(tmpTableName);
        }
    }
}
