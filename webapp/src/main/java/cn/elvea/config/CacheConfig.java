package cn.elvea.config;

import cn.elvea.Application;
import cn.elvea.commons.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.session.config.annotation.web.http.EnableSpringHttpSession;

@Configuration
@EnableCaching
@EnableSpringHttpSession
public class CacheConfig {
    @Autowired
    private Application application;

    @Primary
    @Bean(name = "cacheManager")
    public CacheManager cacheManager() {
        return redisCacheManager();
    }

    // --------------  Redis Cofig --------------
    @Bean
    public RedisCacheManager redisCacheManager() {
        return new RedisCacheManager(redisTemplate());
    }

    @Bean
    public JedisConnectionFactory jedisConnectionFactory() {
        String host = application.getProperty("redis.host", String.class, "127.0.0.1");
        int port = application.getProperty("redis.port", Integer.class, 6379);
        String password = application.getProperty("redis.password", String.class, "");

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
