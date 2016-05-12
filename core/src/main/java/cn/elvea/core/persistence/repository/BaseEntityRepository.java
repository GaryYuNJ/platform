package cn.elvea.core.persistence.repository;

import cn.elvea.core.domain.IdEntity;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;

/**
 * 封装基于实体类的基本方法
 *
 * @param <T>
 * @param <PK>
 */
@NoRepositoryBean
public interface BaseEntityRepository<T extends IdEntity, PK extends Serializable> extends BaseRepository<T, PK> {
}
