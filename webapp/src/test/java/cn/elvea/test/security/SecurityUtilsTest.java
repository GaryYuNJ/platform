package cn.elvea.test.security;

import cn.elvea.commons.utils.EncryptUtils;
import cn.elvea.core.security.SecurityConstants;
import cn.elvea.core.security.SecurityToken;
import cn.elvea.core.security.SecurityUser;
import cn.elvea.core.security.SecurityUtils;
import cn.elvea.test.core.BaseTest;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.util.ByteSource;
import org.junit.Assert;
import org.junit.Test;

public class SecurityUtilsTest extends BaseTest {
    /**
     * 密码加密测试
     */
    @Test
    public void encryptPasswordTest() {
        String username = "root";
        String password = "123456";
        byte[] salt = EncryptUtils.decodeHex("12345678");
        String entryptedPassword = SecurityUtils.entryptPassword("123456", salt);

        System.out.println("Plain Password - " + password);
        System.out.println("Encrypted Password - " + entryptedPassword);

        SecurityToken token = SecurityToken.createFormToken(username, password, null, null, false);
        AuthenticationInfo info = new SimpleAuthenticationInfo(
                new SecurityUser(token.getUsername(), token.getUsername()),
                entryptedPassword, ByteSource.Util.bytes(salt), token.getUsername()
        );

        HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher(SecurityConstants.HASH_ALGORITHM);
        credentialsMatcher.setHashIterations(SecurityConstants.HASH_INTERATIONS);

        Assert.assertTrue(credentialsMatcher.doCredentialsMatch(token, info));
    }
}
