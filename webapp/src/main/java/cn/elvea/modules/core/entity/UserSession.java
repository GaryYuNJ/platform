package cn.elvea.modules.core.entity;

import cn.elvea.commons.domain.IdEntity;

import java.util.Date;

public class UserSession extends IdEntity {
    private String sessionId;
    private String username;
    private String host;
    private String device;
    private Date lastAccessDatetime;
    private Date startDatetime;
    private Date endDatetime;

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getDevice() {
        return device;
    }

    public void setDevice(String device) {
        this.device = device;
    }

    public Date getLastAccessDatetime() {
        return lastAccessDatetime;
    }

    public void setLastAccessDatetime(Date lastAccessDatetime) {
        this.lastAccessDatetime = lastAccessDatetime;
    }

    public Date getStartDatetime() {
        return startDatetime;
    }

    public void setStartDatetime(Date startDatetime) {
        this.startDatetime = startDatetime;
    }

    public Date getEndDatetime() {
        return endDatetime;
    }

    public void setEndDatetime(Date endDatetime) {
        this.endDatetime = endDatetime;
    }
}
