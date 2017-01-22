package cn.elvea.core.auth.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.core.auth.domain.RolePermission;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RolePermissionMapper extends BaseEntityMapper<RolePermission> {
}
