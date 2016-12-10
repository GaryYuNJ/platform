package cn.elvea.modules.auth.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.modules.auth.entity.EntityPermission;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EntityPermissionMapper extends BaseEntityMapper<EntityPermission> {
}
