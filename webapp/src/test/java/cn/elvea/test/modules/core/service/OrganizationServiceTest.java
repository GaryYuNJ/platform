package cn.elvea.test.modules.core.service;

import cn.elvea.modules.core.domain.Organization;
import cn.elvea.modules.core.service.OrganizationService;
import cn.elvea.test.core.BaseTest;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class OrganizationServiceTest extends BaseTest {
    @Autowired
    OrganizationService organizationService;

    @Test
    public void crudTest() {
        Organization org = new Organization();
        org.setCode("Test");
        org.setTitle("Test");
        org.setDescription("Test");

        int id = organizationService.savaOrUpdate(org);
        Assert.assertTrue(id > 0);
    }
}
