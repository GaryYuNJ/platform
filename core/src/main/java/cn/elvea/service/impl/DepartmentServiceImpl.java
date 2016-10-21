package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.Department;
import cn.elvea.repository.DepartmentRepository;
import cn.elvea.service.DepartmentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DepartmentServiceImpl extends BaseJpaEntityService<Department, Long, DepartmentRepository> implements DepartmentService {
}
