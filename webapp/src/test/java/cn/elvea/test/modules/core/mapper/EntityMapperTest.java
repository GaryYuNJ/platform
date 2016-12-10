package cn.elvea.test.modules.core.mapper;

import cn.elvea.modules.core.mapper.EntityMapper;
import cn.elvea.test.core.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class EntityMapperTest extends BaseTest {
    @Autowired
    EntityMapper entityMapper;

    @Test
    public void test() {
        entityMapper.selectAll();
    }
}
