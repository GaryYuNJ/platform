package cn.elvea.test.modules.core.mapper;

import cn.elvea.modules.core.mapper.ActorMapper;
import cn.elvea.test.core.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class EntityMapperTest extends BaseTest {
    @Autowired
    ActorMapper actorMapper;

    @Test
    public void test() {
        actorMapper.selectAll();
    }
}
