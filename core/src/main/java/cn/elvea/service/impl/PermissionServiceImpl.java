package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.Permission;
import cn.elvea.repository.PermissionRepository;
import cn.elvea.service.PermissionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PermissionServiceImpl extends BaseJpaEntityService<Permission, Long, PermissionRepository> implements PermissionService {

    public boolean exists(String code) {
        return false;
    }

    public Permission findByCode(String code) {
        return repository.findByCode(code);
    }
}
