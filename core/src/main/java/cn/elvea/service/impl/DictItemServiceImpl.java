package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.DictItem;
import cn.elvea.repository.DictItemRepository;
import cn.elvea.service.DictItemService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DictItemServiceImpl extends BaseJpaEntityService<DictItem, Long, DictItemRepository> implements DictItemService {
}
