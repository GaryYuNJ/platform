package cn.elvea.commons.persistence.mybatis;

import cn.elvea.commons.domain.IdEntity;
import tk.mybatis.mapper.common.BaseMapper;

public interface BaseEntityMapper<T extends IdEntity> extends BaseMapper<T> {
}
