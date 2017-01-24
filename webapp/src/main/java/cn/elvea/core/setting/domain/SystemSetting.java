package cn.elvea.core.setting.domain;

import cn.elvea.commons.domain.IdEntity;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName("sys_organization")
public class SystemSetting extends IdEntity {
    // 机构ID
    private Long orgId;
    // Key
    private String key;
    // Value
    private String value;
    // 实体修改时间
    private String updatedAt;
    // 实体修改人
    private String updatedBy;

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

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
