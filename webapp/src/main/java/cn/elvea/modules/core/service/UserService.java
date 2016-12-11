package cn.elvea.modules.core.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.modules.core.domain.User;
import cn.elvea.modules.core.mapper.UserMapper;
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
