package cn.elvea.core.i18n.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.core.i18n.domain.LangLabel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LangLabelMapper extends BaseEntityMapper<LangLabel> {
}
