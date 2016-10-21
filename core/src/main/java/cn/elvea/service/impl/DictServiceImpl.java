package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.Dict;
import cn.elvea.repository.DictRepository;
import cn.elvea.service.DictService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DictServiceImpl extends BaseJpaEntityService<Dict, Long, DictRepository> implements DictService {
}
