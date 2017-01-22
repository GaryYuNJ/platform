package cn.elvea.core.department.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.core.department.domain.Department;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

@Mapper
public interface DepartmentMapper extends BaseEntityMapper<Department> {
    @Service
    class DepartmentService extends BaseEntityService<DepartmentMapper, Department> {
    }
}
