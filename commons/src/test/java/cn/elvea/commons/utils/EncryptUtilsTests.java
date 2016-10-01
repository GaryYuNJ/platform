package cn.elvea.commons.utils;

import org.junit.Assert;
import org.junit.Test;

public class EncryptUtilsTests {
    @Test
    public void base64Test() {
        String str = "!@#$%^&*()_";
        String encryptedStr = EncryptUtils.encodeBase64(str);
        String decryptedStr = EncryptUtils.decodeBase64(encryptedStr);
        System.out.println("1 - " + str);
        System.out.println("2 - " + encryptedStr);
        System.out.println("3 - " + decryptedStr);
        Assert.assertEquals(str, decryptedStr);
    }

    @Test
    public void aesTest() {
        String str = "!@#$%^&*()_";
        String encryptedStr = EncryptUtils.aesEncrypt(str);
        String decryptedStr = EncryptUtils.aesDecrypt(encryptedStr);
        System.out.println("1 - " + str);
        System.out.println("2 - " + encryptedStr);
        System.out.println("3 - " + decryptedStr);
        Assert.assertEquals(str, decryptedStr);
    }

    @Test
    public void desTest() {
        String str = "!@#$%^&*()_";
        String encryptedStr = EncryptUtils.desEncrypt(str);
        String decryptedStr = EncryptUtils.desDecrypt(encryptedStr);
        System.out.println("1 - " + str);
        System.out.println("2 - " + encryptedStr);
        System.out.println("3 - " + decryptedStr);
        Assert.assertEquals(str, decryptedStr);
    }

    @Test
    public void md5Test() {
        String str = "!@#$%^&*()_";
        String encryptedStr = EncryptUtils.md5Encrypt(str);
        System.out.println("MD5 start.");
        System.out.println("1 - " + str);
        System.out.println("2 - " + encryptedStr);
        System.out.println("MD5 end.");
    }

    @Test
    public void baseTest() {
        String str = "!@#$%^&*()_";
        String encryptedStr = EncryptUtils.encrypt(str);
        String decryptedStr = EncryptUtils.decrypt(encryptedStr);
        System.out.println("start.");
        System.out.println("1 - " + str);
        System.out.println("2 - " + encryptedStr);
        System.out.println("3 - " + decryptedStr);
        System.out.println("end.");
    }

    @Test
    public void keyTest() {
        String key = EncryptUtils.generateKey(8);
        Assert.assertNotNull(key);
        System.out.println("key start.");
        System.out.println("1 - " + key);
        System.out.println("key end.");
    }
}
