package cn.elvea.core.actor.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.core.auth.domain.Role;
import cn.elvea.core.auth.mapper.RoleMapper;
import org.springframework.stereotype.Service;

@Service
public class RoleService extends BaseEntityService<RoleMapper, Role> {
}
