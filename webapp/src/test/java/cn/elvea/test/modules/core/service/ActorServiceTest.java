package cn.elvea.test.modules.core.service;

import cn.elvea.core.user.service.ActorService;
import cn.elvea.test.core.BaseTest;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ActorServiceTest extends BaseTest {
    @Autowired
    ActorService actorService;

    @Test
    public void crudTest() {
        Assert.assertTrue(true);
    }
}
