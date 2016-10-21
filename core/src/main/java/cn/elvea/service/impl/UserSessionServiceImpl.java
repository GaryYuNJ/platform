package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.UserSession;
import cn.elvea.repository.UserSessionRepository;
import cn.elvea.security.filter.CaptchaAuthFilter;
import cn.elvea.service.UserSessionService;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SimpleSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Date;

@Service
@Transactional
public class UserSessionServiceImpl extends BaseJpaEntityService<UserSession, Long, UserSessionRepository> implements UserSessionService {
    public Session findBySessionId(Serializable sessionId) {
        UserSession userSession = repository.findBySessionId(sessionId);
        return coverUserSessionToSession(userSession);
    }

    public void createUserSession(Session session) {
        UserSession userSession = coverSessionToUserSession(session);
        if (userSession != null) {
            if (session.getAttribute(CaptchaAuthFilter.Shiro_Session_Username_Key) != null) {
                String username = (String) session.getAttribute(CaptchaAuthFilter.Shiro_Session_Username_Key);
                userSession.setUsername(username);
            }
            repository.save(userSession);
        }
    }

    public void deleteUserSession(Session session) {
        UserSession userSession = repository.findBySessionId(String.valueOf(session.getId()));
        if (userSession != null) {
            if (session.getAttribute(CaptchaAuthFilter.Shiro_Session_Username_Key) != null) {
                String username = (String) session.getAttribute(CaptchaAuthFilter.Shiro_Session_Username_Key);
                userSession.setUsername(username);
            }
            userSession.setEndDatetime(new Date());
            repository.save(userSession);
        }
    }

    public void updateUserSession(Session session) {
        UserSession userSession = repository.findBySessionId(String.valueOf(session.getId()));
        if (userSession != null) {
            if (session.getAttribute(CaptchaAuthFilter.Shiro_Session_Username_Key) != null) {
                String username = (String) session.getAttribute(CaptchaAuthFilter.Shiro_Session_Username_Key);
                userSession.setUsername(username);
            }
            userSession.setLastAccessDatetime(new Date());
            repository.save(userSession);
        }
    }

    private UserSession coverSessionToUserSession(Session session) {
        UserSession userSession = new UserSession();
        userSession.setSessionId(String.valueOf(session.getId()));
        userSession.setLastAccessDatetime(session.getLastAccessTime());
        userSession.setHost(session.getHost());
        userSession.setStartDatetime(session.getStartTimestamp());
        return userSession;
    }

    private Session coverUserSessionToSession(UserSession userSession) {
        SimpleSession session = new SimpleSession();
        session.setId(userSession.getId());
        session.setLastAccessTime(userSession.getLastAccessDatetime());
        session.setHost(userSession.getHost());
        session.setStartTimestamp(userSession.getStartDatetime());
        return session;
    }
}
