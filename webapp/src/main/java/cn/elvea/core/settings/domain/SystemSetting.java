package cn.elvea.core.settings.domain;

import cn.elvea.commons.domain.IdEntity;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName("sys_organization")
public class SystemSetting extends IdEntity {
    // Key
    private String key;
    // Value
    private String value;
    // 实体创建时间
    private String createdAt;
    // 实体创建人
    private String createdBy;
    // 实体修改时间
    private String updatedAt;
    // 实体修改人
    private String updatedBy;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }
}
