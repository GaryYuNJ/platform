package cn.elvea.config;

import cn.elvea.core.security.SecurityConstants;
import cn.elvea.core.security.SecurityDefinitionSource;
import cn.elvea.core.security.SecurityRealm;
import cn.elvea.core.security.SecurityToken;
import cn.elvea.core.security.filter.ApiAuthFilter;
import cn.elvea.core.security.filter.FormAuthFilter;
import cn.elvea.core.security.filter.SsoAuthFilter;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.RememberMeManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class WebSecurityConfig {
    private static Logger logger = LoggerFactory.getLogger(WebSecurityConfig.class);

    @Bean
    public ShiroFilterFactoryBean shiroFilter() throws Exception {
        logger.debug("create shiro filter.");
        FormAuthFilter formFilter = new FormAuthFilter();
        formFilter.setLoginUrl("/login");

        SsoAuthFilter ssoFilter = new SsoAuthFilter();
        ssoFilter.setLoginUrl("/sso/login");

        ApiAuthFilter apiFilter = new ApiAuthFilter();
        apiFilter.setLoginUrl("/api/login");

        Map<String, Filter> filters = new HashMap<>();
        filters.put("authc", formFilter);
        filters.put("sso_authc", ssoFilter);
        filters.put("api_authc", ssoFilter);

        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSuccessUrl("/home");
        shiroFilterFactoryBean.setUnauthorizedUrl("/unauthorized");
        shiroFilterFactoryBean.setFilters(filters);
        shiroFilterFactoryBean.setSecurityManager(securityManager());
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionSource().getObject());
        return shiroFilterFactoryBean;
    }

    @Bean(name = "securityManager")
    public org.apache.shiro.mgt.SecurityManager securityManager() {
        logger.debug("create security manager.");

        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(realm());
        securityManager.setSessionManager(sessionManager());
        securityManager.setRememberMeManager(rememberMeManager());
        return securityManager;
    }

    @Bean(name = "sessionManager")
    public SessionManager sessionManager() {
        return new DefaultWebSessionManager();
    }

    @Bean(name = "realm")
    @DependsOn("lifecycleBeanPostProcessor")
    public AuthorizingRealm realm() {
        HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher(SecurityConstants.HASH_ALGORITHM);
        credentialsMatcher.setHashIterations(SecurityConstants.HASH_INTERATIONS);

        SecurityRealm securityRealm = new SecurityRealm();
        securityRealm.setCredentialsMatcher(credentialsMatcher);
        securityRealm.setAuthenticationTokenClass(SecurityToken.class);
        return securityRealm;
    }

    @Bean
    public RememberMeManager rememberMeManager() {
        logger.debug("create remember me manager.");

        SimpleCookie simpleCookie = new SimpleCookie("rememberMe");
        simpleCookie.setHttpOnly(true);
        simpleCookie.setMaxAge(2592000);

        CookieRememberMeManager rememberMeManager = new CookieRememberMeManager();
        rememberMeManager.setCookie(simpleCookie);
        return rememberMeManager;
    }

    @Bean
    public static LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    @DependsOn("lifecycleBeanPostProcessor")
    public static DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        advisorAutoProxyCreator.setProxyTargetClass(true);
        return advisorAutoProxyCreator;
    }

    @Bean
    public SecurityDefinitionSource filterChainDefinitionSource() {
        return new SecurityDefinitionSource();
    }
}
