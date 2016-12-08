package cn.elvea.modules.core.service;

import cn.elvea.modules.core.entity.User;
import org.springframework.stereotype.Service;

@Service
public class UserService {
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
