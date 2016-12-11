package cn.elvea.modules.core.domain;

import javax.persistence.Table;

@Table(name = "sys_position")
public class Position extends Entity {
    // 岗位编号
    private String code;
    // 岗位标题
    private String title;
    // 岗位描述
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
