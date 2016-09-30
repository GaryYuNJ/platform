package cn.elvea.service.impl;

import cn.elvea.commons.persistence.repository.BaseEntityRepository;
import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.Catalog;
import cn.elvea.repository.CatalogRepository;
import cn.elvea.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CatalogServiceImpl extends BaseJpaEntityService<Catalog, Long> implements CatalogService {
    @Autowired
    CatalogRepository catalogRepository;

    @Override
    protected BaseEntityRepository<Catalog, Long> getEntityRepository() {
        return catalogRepository;
    }
}
