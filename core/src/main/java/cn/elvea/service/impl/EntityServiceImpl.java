package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.Entity;
import cn.elvea.repository.EntityRepository;
import cn.elvea.service.EntityService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EntityServiceImpl extends BaseJpaEntityService<Entity, Long, EntityRepository> implements EntityService {
}
