package cn.elvea.core.i18n.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.core.i18n.domain.Lang;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LangMapper extends BaseEntityMapper<Lang> {
}
