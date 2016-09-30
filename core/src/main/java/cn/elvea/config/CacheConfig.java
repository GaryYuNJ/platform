package cn.elvea.config;

import cn.elvea.commons.cache.CustomCacheErronrHandler;
import cn.elvea.commons.cache.CustomCacheResolver;
import cn.elvea.commons.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;
import org.springframework.cache.interceptor.CacheErrorHandler;
import org.springframework.cache.interceptor.CacheResolver;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.cache.interceptor.SimpleKeyGenerator;
import org.springframework.cache.support.CompositeCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.LinkedHashSet;
import java.util.Set;

@Configuration
@EnableCaching
public class CacheConfig implements CachingConfigurer {
    @Autowired
    private Environment env = null;

    // --------------  Cache Cofig --------------
    @Bean(name = "cacheResolver")
    @Override
    public CacheResolver cacheResolver() {
        return new CustomCacheResolver();
    }

    @Bean(name = "cacheManager")
    @Override
    public CacheManager cacheManager() {
        Set<CacheManager> caches = new LinkedHashSet<>();
        caches.add(ehCacheCacheManager());
        caches.add(redisCacheManager());

        CompositeCacheManager compositeCacheManager = new CompositeCacheManager();
        compositeCacheManager.setCacheManagers(caches);
        compositeCacheManager.setFallbackToNoOpCache(true);
        return compositeCacheManager;
    }

    @Override
    public KeyGenerator keyGenerator() {
        return new SimpleKeyGenerator();
    }

    @Override
    public CacheErrorHandler errorHandler() {
        return new CustomCacheErronrHandler();
    }

    // --------------  EhCache Cofig --------------
    @Bean
    public static EhCacheCacheManager ehCacheCacheManager() {
        return new EhCacheCacheManager(ehCacheManagerFactoryBean().getObject());
    }

    @Bean
    public static EhCacheManagerFactoryBean ehCacheManagerFactoryBean() {
        EhCacheManagerFactoryBean factoryBean = new EhCacheManagerFactoryBean();
        factoryBean.setConfigLocation(new ClassPathResource("ehcache.xml"));
        factoryBean.setShared(true);
        return factoryBean;
    }

    // --------------  Redis Cofig --------------
    @Bean
    public RedisCacheManager redisCacheManager() {
        return new RedisCacheManager(redisTemplate());
    }

    @Bean
    public JedisConnectionFactory jedisConnectionFactory() {
        String host = env.getProperty("redis.host", String.class, "127.0.0.1");
        int port = env.getProperty("redis.port", Integer.class, 6379);
        String password = env.getProperty("redis.password", String.class, "");

        JedisConnectionFactory factory = new JedisConnectionFactory();
        factory.setHostName(host);
        factory.setPort(port);
        if (StringUtils.isNotEmpty(password)) {
            factory.setPassword(password);
        }
        return factory;
    }

    @Bean
    public RedisTemplate redisTemplate() {
        RedisTemplate redisTemplate = new RedisTemplate();
        redisTemplate.setConnectionFactory(jedisConnectionFactory());
        return redisTemplate;
    }
}
