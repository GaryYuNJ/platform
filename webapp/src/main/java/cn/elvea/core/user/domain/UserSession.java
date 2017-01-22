package cn.elvea.core.user.domain;

import cn.elvea.commons.domain.IdEntity;
import com.baomidou.mybatisplus.annotations.TableName;

import java.util.Date;

@TableName("sys_entity")
public class UserSession extends IdEntity {
    // 会话ID
    private String sessionId;
    // 实体ID
    private String entityId;
    // 用户名
    private String username;
    // 登录主机
    private String host;
    // 登录设备
    private String device;
    // 最后访问时间
    private Date lastAccessDatetime;
    // 开始时间
    private Date startDatetime;
    // 结束时间
    private Date endDatetime;

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getEntityId() {
        return entityId;
    }

    public void setEntityId(String entityId) {
        this.entityId = entityId;
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
