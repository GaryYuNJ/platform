package cn.elvea.core.user.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.core.user.domain.Actor;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ActorMapper extends BaseEntityMapper<Actor> {
}
