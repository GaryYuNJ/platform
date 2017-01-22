package cn.elvea.core.user.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.core.user.domain.Position;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PositionMapper extends BaseEntityMapper<Position> {
}
