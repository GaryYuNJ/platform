package cn.elvea.core.auth.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.core.auth.domain.Permission;
import cn.elvea.core.auth.mapper.PermissionMapper;
import org.springframework.stereotype.Service;

@Service
public class PermissionService extends BaseEntityService<PermissionMapper, Permission> {
}
