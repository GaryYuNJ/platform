package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.ResourceAccess;
import cn.elvea.repository.ResourceAccessRepository;
import cn.elvea.service.ResourceAccessService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ResourceAccessServiceImpl extends BaseJpaEntityService<ResourceAccess, Long, ResourceAccessRepository> implements ResourceAccessService {
}
