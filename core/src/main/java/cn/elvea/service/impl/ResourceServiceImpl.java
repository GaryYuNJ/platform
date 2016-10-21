package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.Resource;
import cn.elvea.repository.ResourceRepository;
import cn.elvea.service.ResourceService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ResourceServiceImpl extends BaseJpaEntityService<Resource, Long, ResourceRepository> implements ResourceService {
}
