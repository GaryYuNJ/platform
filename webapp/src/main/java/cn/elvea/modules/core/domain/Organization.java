package cn.elvea.modules.core.domain;

import javax.persistence.Table;

@Table(name = "sys_organization")
public class Organization extends Entity {
    // 组织编号
    private String code;
    // 组织标题
    private String title;
    // 组织描述
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
