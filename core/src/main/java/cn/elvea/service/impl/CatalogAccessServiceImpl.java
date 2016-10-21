package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.CatalogAccess;
import cn.elvea.repository.CatalogAccessRepository;
import cn.elvea.service.CatalogAccessService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CatalogAccessServiceImpl extends BaseJpaEntityService<CatalogAccess, Long, CatalogAccessRepository> implements CatalogAccessService {
}
