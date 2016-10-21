package cn.elvea.commons.service.jpa;

import cn.elvea.commons.domain.Role;
import cn.elvea.commons.persistence.repository.RoleRepository;
import org.springframework.stereotype.Service;

@Service
public class RoleService extends BaseJpaEntityService<Role, Long, RoleRepository> {
}
