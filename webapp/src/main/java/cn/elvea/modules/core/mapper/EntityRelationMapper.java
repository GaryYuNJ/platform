package cn.elvea.modules.core.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.modules.core.domain.EntityRelation;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EntityRelationMapper extends BaseEntityMapper<EntityRelation> {
}
