package cn.elvea.commons.service.jpa;

import cn.elvea.commons.domain.IdEntity;
import cn.elvea.commons.persistence.repository.BaseEntityRepository;
import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.commons.web.RequestContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

@Transactional
public abstract class BaseJpaEntityService<T extends IdEntity, PK extends Serializable, R extends BaseEntityRepository<T, PK>> extends BaseJpaService implements BaseEntityService<T, PK> {
    @Autowired
    protected R repository;

    @Override
    protected BaseEntityRepository getRepository() {
        return repository;
    }

    protected BaseEntityRepository getEntityRepository() {
        return repository;
    }

    public void insert(T entity) {
        save(entity);
    }

    public void update(T entity) {
        save(entity);
    }

    public void save(T entity) {
        repository.save(entity);
    }

    public void delete(PK id) {
        repository.delete(id);
    }

    public T get(PK id) {
        return repository.getOne(id);
    }

    public Page<T> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public Page<T> search(RequestContext request, Pageable pageable) {
        return repository.findAll(specification(request), pageable);
    }

    protected Specification<T> specification(final RequestContext request) {
        return (root, query, builder) -> query.getRestriction();
    }
}
