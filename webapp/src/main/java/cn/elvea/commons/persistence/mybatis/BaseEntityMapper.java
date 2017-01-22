package cn.elvea.commons.persistence.mybatis;

import cn.elvea.commons.domain.IdEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;

public interface BaseEntityMapper<T extends IdEntity> extends BaseMapper<T> {
}
