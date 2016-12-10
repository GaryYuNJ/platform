package cn.elvea.modules.core.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.modules.core.entity.Position;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PositionMapper extends BaseEntityMapper<Position> {
}
