package cn.elvea.modules.auth.domain;

import cn.elvea.commons.domain.IdEntity;

import javax.persistence.Table;

@Table(name = "sys_permission")
public class Permission extends IdEntity {
    // 权限编号
    private String code;
    // 权限标题
    private String title;
    // 权限描述
    private String description;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
