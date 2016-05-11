package cn.elvea.persistence.dao;

import cn.elvea.core.persistence.dao.BaseEntityDao;
import cn.elvea.entity.User;
import org.springframework.stereotype.Repository;

@Repository(value = "jdbcUserDao")
public class UserDao extends BaseEntityDao<User, Long> {
}
