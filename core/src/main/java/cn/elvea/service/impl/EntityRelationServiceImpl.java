package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.EntityRelation;
import cn.elvea.repository.EntityRelationRepository;
import cn.elvea.service.EntityRelationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EntityRelationServiceImpl extends BaseJpaEntityService<EntityRelation, Long, EntityRelationRepository> implements EntityRelationService {
}
