package cn.elvea.core.actor.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.core.actor.domain.Actor;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ActorMapper extends BaseEntityMapper<Actor> {
}
