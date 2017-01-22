package cn.elvea.core.settings.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.core.settings.domain.SystemSetting;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SystemSettingMapper extends BaseEntityMapper<SystemSetting> {

}
