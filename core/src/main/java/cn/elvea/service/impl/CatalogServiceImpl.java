package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.Catalog;
import cn.elvea.repository.CatalogRepository;
import cn.elvea.service.CatalogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CatalogServiceImpl extends BaseJpaEntityService<Catalog, Long, CatalogRepository> implements CatalogService {
}
