package cn.elvea.core.user.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.core.user.domain.User;
import cn.elvea.core.user.mapper.UserMapper;
import org.springframework.stereotype.Service;

@Service
public class UserService extends BaseEntityService<UserMapper, User> {
    public User findByUsername(String username) {
        return null;
    }

    public String encryptPassword(String plainPassword, String salt) {
        return null;
    }

    public String encryptPassword(User user) {
        return null;
    }
}
