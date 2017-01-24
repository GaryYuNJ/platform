package cn.elvea.core.i18n.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.core.i18n.domain.Lang;
import cn.elvea.core.i18n.mapper.LangMapper;
import org.springframework.stereotype.Service;

@Service
public class LangService extends BaseEntityService<LangMapper, Lang> {
}
