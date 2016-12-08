package cn.elvea.modules.core.service;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class UserSessionService {
    public Session findBySessionId(Serializable sessionId) {
        return null;
    }

    public void createUserSession(Session session) {
    }

    public void deleteUserSession(Session session) {
    }

    public void updateUserSession(Session session) {
    }
}
