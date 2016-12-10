package cn.elvea.modules.core.entity;

import cn.elvea.commons.domain.IdEntity;

import javax.persistence.Table;

@Table(name = "sys_entity")
public class Entity extends IdEntity {
    // 实体唯一ID
    private String uid;
    // 实体来源
    private String source;
    // 实体类型
    private String type;
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

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

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
