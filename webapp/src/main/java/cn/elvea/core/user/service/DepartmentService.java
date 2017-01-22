package cn.elvea.core.user.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.core.user.domain.Department;
import cn.elvea.core.user.mapper.DepartmentMapper;
import org.springframework.stereotype.Service;

@Service
public class DepartmentService extends BaseEntityService<DepartmentMapper, Department> {
}
