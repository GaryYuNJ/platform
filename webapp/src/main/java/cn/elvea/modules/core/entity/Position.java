package cn.elvea.modules.core.entity;

import cn.elvea.commons.domain.IdEntity;

public class Position extends IdEntity {
    // 岗位编号
    private String code;
    // 岗位名称
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
