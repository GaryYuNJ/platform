package cn.elvea.modules.core.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.modules.core.domain.Organization;
import cn.elvea.modules.core.mapper.OrganizationMapper;
import org.springframework.stereotype.Service;

@Service
public class OrganizationService extends BaseEntityService<OrganizationMapper, Organization> {
    @Override
    public Integer insert(Organization entity) {
        return super.insert(entity);
    }

    @Override
    public Integer update(Organization entity) {
        return super.update(entity);
    }

    @Override
    public Integer savaOrUpdate(Organization entity) {
        return super.savaOrUpdate(entity);
    }
}
