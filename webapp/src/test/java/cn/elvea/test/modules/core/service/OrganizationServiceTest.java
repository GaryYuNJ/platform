package cn.elvea.test.modules.core.service;

import cn.elvea.Constants;
import cn.elvea.modules.core.domain.ActorRelation;
import cn.elvea.modules.core.domain.Organization;
import cn.elvea.modules.core.service.ActorService;
import cn.elvea.modules.core.service.OrganizationService;
import cn.elvea.test.core.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class OrganizationServiceTest extends BaseTest {
    @Autowired
    OrganizationService organizationService;

    @Autowired
    ActorService actorService;

    @Test
    public void crudTest() {
        Organization org = new Organization();
        org.setCode("Test");
        org.setTitle("Test");
        org.setDescription("Test");
        org.setStatus(Constants.STATUS_OK);
        organizationService.save(org);

        Organization sub = new Organization();
        sub.setCode("Test");
        sub.setTitle("Test");
        sub.setDescription("Test");
        sub.setStatus(Constants.STATUS_OK);
        organizationService.save(sub);

        actorService.saveOrUpdateRelations(sub.getId(), org.getId(), ActorRelation.R_ORG_PARENT_ORG);

    }
}
