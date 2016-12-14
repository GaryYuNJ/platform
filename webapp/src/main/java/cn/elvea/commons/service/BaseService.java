package cn.elvea.commons.service;

import cn.elvea.commons.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class BaseService {
    @Autowired
    IdWorker idWorker;

    public Long generateNextId() {
        return idWorker.nextId();
    }

    public IdWorker getIdWorker() {
        return idWorker;
    }

    public void setIdWorker(IdWorker idWorker) {
        this.idWorker = idWorker;
    }
}
