package cn.elvea.test.modules.core.mapper;

import cn.elvea.core.user.mapper.ActorRelationMapper;
import cn.elvea.test.core.BaseTest;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ActorRelationMapperTest extends BaseTest {
    @Autowired
    ActorRelationMapper actorRelationMapper;

    @Test
    public void test() {
        Assert.assertTrue(true);
    }
}
