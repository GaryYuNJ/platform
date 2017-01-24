package cn.elvea.core.setting.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.core.setting.domain.SystemSetting;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SystemSettingMapper extends BaseEntityMapper<SystemSetting> {
}
