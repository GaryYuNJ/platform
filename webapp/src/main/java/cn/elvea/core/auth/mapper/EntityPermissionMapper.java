package cn.elvea.core.auth.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.core.auth.domain.EntityPermission;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EntityPermissionMapper extends BaseEntityMapper<EntityPermission> {
}
