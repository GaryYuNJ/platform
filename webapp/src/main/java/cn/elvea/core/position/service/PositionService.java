package cn.elvea.core.position.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.core.position.domain.Position;
import cn.elvea.core.position.mapper.PositionMapper;
import org.springframework.stereotype.Service;

@Service
public class PositionService extends BaseEntityService<PositionMapper, Position> {
}
