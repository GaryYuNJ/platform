package cn.elvea.test.modules.core.service;

import cn.elvea.modules.core.domain.Actor;
import cn.elvea.modules.core.service.ActorService;
import cn.elvea.test.core.BaseTest;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ActorServiceTest extends BaseTest {
    @Autowired
    ActorService actorService;

    @Test
    public void crudTest() {
        Actor actor = new Actor();
        actor.setUid("ORG10001");
        actor.setType("Test");
        actor.setStatus("Test");
        actor.setSource("Test");
        int id = actorService.savaOrUpdate(actor);
        Assert.assertTrue(id > 0);
    }
}
