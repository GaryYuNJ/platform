package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.EntityPermission;
import cn.elvea.repository.EntityPermissionRepository;
import cn.elvea.service.EntityPermissionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EntityPermissionServiceImpl extends BaseJpaEntityService<EntityPermission, Long, EntityPermissionRepository> implements EntityPermissionService {
}
