package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.Organization;
import cn.elvea.repository.OrganizationRepository;
import cn.elvea.service.OrganizationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrganizationServiceImpl extends BaseJpaEntityService<Organization, Long, OrganizationRepository> implements OrganizationService {
}
