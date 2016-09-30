package cn.elvea.service.impl;

import cn.elvea.commons.persistence.repository.BaseEntityRepository;
import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.Resource;
import cn.elvea.repository.ResourceRepository;
import cn.elvea.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ResourceServiceImpl extends BaseJpaEntityService<Resource, Long> implements ResourceService {
    @Autowired
    ResourceRepository resourceRepository;

    @Override
    protected BaseEntityRepository<Resource, Long> getEntityRepository() {
        return resourceRepository;
    }
}
