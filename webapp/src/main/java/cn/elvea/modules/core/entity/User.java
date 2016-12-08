package cn.elvea.modules.core.entity;

import cn.elvea.commons.domain.IdEntity;
import com.google.common.collect.Lists;

import java.util.List;

public class User extends IdEntity {
    // 用户名
    private String username;
    // 邮箱
    private String email;
    // 昵称
    private String nickname;
    // 全名
    private String fullname;
    // 密码
    private String password;
    // 加密盐
    private String salt;
    // 用户角色
    private List<Role> roles = Lists.newArrayList();

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
}
