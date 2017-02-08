package cn.elvea.config;

import com.baomidou.mybatisplus.entity.GlobalConfiguration;
import com.baomidou.mybatisplus.enums.DBType;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.enums.Optimize;
import com.baomidou.mybatisplus.mapper.AutoSqlInjector;
import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.spring.MybatisSqlSessionFactoryBean;
import org.apache.ibatis.plugin.Interceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

import javax.sql.DataSource;

@Configuration
@AutoConfigureAfter(Config.class)
@MapperScan("cn.elvea.**.mapper")
public class MyBatisConfig {
    @Autowired
    DataSource dataSource;

    @Bean
    public MybatisSqlSessionFactoryBean mybatisSqlSessionFactoryBean() {
        try {
            MybatisSqlSessionFactoryBean sqlSessionFactoryBean = new MybatisSqlSessionFactoryBean();
            sqlSessionFactoryBean.setDataSource(dataSource);
            sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("mybatis/mybatis-config.xml"));
            sqlSessionFactoryBean.setGlobalConfig(mybatisPlusGlobalConfiguration());
            sqlSessionFactoryBean.setPlugins(getMyBatisPlugins());
            return sqlSessionFactoryBean;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private Interceptor[] getMyBatisPlugins() {
        // 分页插件
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
        paginationInterceptor.setDialectType(DBType.MYSQL.getDb());
        paginationInterceptor.setOptimizeType(Optimize.JSQLPARSER.getOptimize());

        return new Interceptor[]{paginationInterceptor};
    }

    @Bean(name = "mybatisPlusGlobalConfiguration")
    public GlobalConfiguration mybatisPlusGlobalConfiguration() {
        GlobalConfiguration configuration = new GlobalConfiguration();
        configuration.setSqlInjector(new AutoSqlInjector());
        configuration.setDbType(DBType.MYSQL.getDb());
        configuration.setIdType(IdType.ID_WORKER.getKey());
        configuration.setDbColumnUnderline(true);
        return configuration;
    }
}
