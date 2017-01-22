package cn.elvea.core.user.domain;

import cn.elvea.commons.domain.IdEntity;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName("sys_v_actor")
public class Actor extends IdEntity {
    // 实体状态
    private String status;
    // 实体创建时间
    private String createdAt;
    // 实体创建人
    private String createdBy;
    // 实体修改时间
    private String updatedAt;
    // 实体修改人
    private String updatedBy;
    // 实体删除时间
    private String deletedAt;
    // 实体删除人
    private String deletedBy;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public String getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(String deletedAt) {
        this.deletedAt = deletedAt;
    }

    public String getDeletedBy() {
        return deletedBy;
    }

    public void setDeletedBy(String deletedBy) {
        this.deletedBy = deletedBy;
    }
}
