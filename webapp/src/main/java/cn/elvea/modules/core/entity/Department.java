package cn.elvea.modules.core.entity;

import cn.elvea.commons.domain.IdEntity;

public class Department extends IdEntity {
    // 部门编号
    private String code;
    // 部门名称
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
