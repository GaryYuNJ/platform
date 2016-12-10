package cn.elvea.commons.service;

import cn.elvea.commons.domain.IdEntity;
import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class BaseEntityService<M extends BaseEntityMapper<T>, T extends IdEntity> extends BaseService {
    @Autowired
    M mapper;
}
