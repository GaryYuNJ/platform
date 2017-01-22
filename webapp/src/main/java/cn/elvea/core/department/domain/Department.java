package cn.elvea.core.department.domain;

import cn.elvea.core.actor.domain.Actor;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName("sys_department")
public class Department extends Actor {
    // 部门编号
    private String code;
    // 部门标题
    private String title;
    // 部门描述
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
