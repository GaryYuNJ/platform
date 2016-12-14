package cn.elvea.modules.system.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.modules.system.domain.SystemSetting;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SystemSettingMapper extends BaseEntityMapper<SystemSetting> {

}
