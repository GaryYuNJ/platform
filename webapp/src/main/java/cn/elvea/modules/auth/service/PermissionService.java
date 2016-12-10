package cn.elvea.modules.auth.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.modules.auth.entity.Permission;
import cn.elvea.modules.auth.mapper.PermissionMapper;
import org.springframework.stereotype.Service;

@Service
public class PermissionService extends BaseEntityService<PermissionMapper, Permission> {
}
