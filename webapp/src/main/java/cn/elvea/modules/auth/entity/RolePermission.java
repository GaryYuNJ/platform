package cn.elvea.modules.auth.entity;

import cn.elvea.commons.domain.IdEntity;

import javax.persistence.Table;
import java.sql.Timestamp;

@Table(name = "sys_role_permission")
public class RolePermission extends IdEntity {
    // 角色ID
    private Long roleId;
    // 权限ID
    private Long permissionId;
    // 关联时间
    private Timestamp createdAt;
    // 关联人
    private Long createdBy;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Long permissionId) {
        this.permissionId = permissionId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }
}
