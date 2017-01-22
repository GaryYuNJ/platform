package cn.elvea.core.user.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.core.user.domain.Role;
import cn.elvea.core.user.mapper.RoleMapper;
import org.springframework.stereotype.Service;

@Service
public class RoleService extends BaseEntityService<RoleMapper, Role> {
}
