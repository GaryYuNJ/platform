package cn.elvea.core.user.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.core.user.domain.Organization;
import cn.elvea.core.user.mapper.OrganizationMapper;
import org.springframework.stereotype.Service;

@Service
public class OrganizationService extends BaseEntityService<OrganizationMapper, Organization> {
}
