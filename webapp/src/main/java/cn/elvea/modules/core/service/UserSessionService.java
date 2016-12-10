package cn.elvea.modules.core.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.modules.core.entity.UserSession;
import cn.elvea.modules.core.mapper.UserSessionMapper;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class UserSessionService extends BaseEntityService<UserSessionMapper, UserSession> {
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
