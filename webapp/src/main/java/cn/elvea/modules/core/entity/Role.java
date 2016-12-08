package cn.elvea.modules.core.entity;

import cn.elvea.commons.domain.IdEntity;

public class Role extends IdEntity {
    // 角色编号
    private String code;
    // 角色名称
    private String title;

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
}
