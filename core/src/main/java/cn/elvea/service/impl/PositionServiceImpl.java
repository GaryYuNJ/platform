package cn.elvea.service.impl;

import cn.elvea.commons.persistence.repository.BaseEntityRepository;
import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.Position;
import cn.elvea.repository.PositionRepository;
import cn.elvea.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PositionServiceImpl extends BaseJpaEntityService<Position, Long> implements PositionService {
    @Autowired
    PositionRepository positionRepository;

    @Override
    protected BaseEntityRepository<Position, Long> getEntityRepository() {
        return positionRepository;
    }
}
