package cn.elvea.config;

import cn.elvea.Application;
import cn.elvea.Constants;
import cn.elvea.commons.persistence.datasource.DynamicDataSource;
import cn.elvea.commons.utils.IdWorker;
import com.alibaba.druid.filter.Filter;
import com.alibaba.druid.filter.logging.Slf4jLogFilter;
import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.pool.DruidDataSource;
import com.google.common.collect.Maps;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Configuration
public class Config implements TransactionManagementConfigurer {
    private static final Logger logger = LoggerFactory.getLogger(Config.class);

    final static String DATASOURCE_MASTER = "master";
    final static String DATASOURCE_SLAVE = "slave";

    final static String DATASOURCE_MASTER_PREFIX = "datasource.master";
    final static String DATASOURCE_SLAVE_PREFIX = "datasource.slave";

    // 默认数据源最大连接数
    public final static int DEFAULT_DATASOURCE_MAX_ACTIVE = 100;
    // 默认数据源初始连接数
    public final static int DEFAULT_DATASOURCE_MIN_IDLE = 10;

    @Autowired
    Application application;

    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("messages/messages");
        messageSource.setDefaultEncoding(Constants.ENCODING);
        return messageSource;
    }

    @Override
    public PlatformTransactionManager annotationDrivenTransactionManager() {
        return transactionManager();
    }

    // 数据事务管理
    @Bean
    public PlatformTransactionManager transactionManager() {
        DataSourceTransactionManager txManager = new DataSourceTransactionManager();
        txManager.setDataSource(dataSource());
        return txManager;
    }

    // 数据源配置
    @Bean
    @Primary
    public DataSource dataSource() {
        boolean useMasterSlave = application.getProperty("datasource.master-slave.enable", Boolean.class, false);

        if (useMasterSlave) {
            DataSource masterDataSource = createDataSource(DATASOURCE_MASTER_PREFIX);
            DataSource slaveDataSource = createDataSource(DATASOURCE_SLAVE_PREFIX);
            Map<Object, Object> targetDataSources = Maps.newHashMap();
            targetDataSources.put(DATASOURCE_MASTER, masterDataSource);
            targetDataSources.put(DATASOURCE_SLAVE, slaveDataSource);

            DynamicDataSource dynamicDataSource = new DynamicDataSource();
            dynamicDataSource.setTargetDataSources(targetDataSources);
            dynamicDataSource.setDefaultTargetDataSource(masterDataSource);
            return dynamicDataSource;
        } else {
            return createDataSource(DATASOURCE_MASTER_PREFIX);
        }
    }

    private DataSource createDataSource(String prefix) {
        boolean useJndi = application.getProperty(prefix + ".jndi.enable", Boolean.class, false); // 是否使用数据源
        String jndiName = application.getProperty(prefix + ".jndi.name", ""); // 数据源名称
        String url = application.getProperty(prefix + ".url", "");
        String username = application.getProperty(prefix + ".username");
        String password = application.getProperty(prefix + ".password");
        String driverClass = application.getProperty(prefix + ".driver", "");
        int maxActive = application.getProperty(prefix + ".max.active", Integer.class, DEFAULT_DATASOURCE_MAX_ACTIVE);   // 数据源最大连接数
        int minIdle = application.getProperty(prefix + ".min.idle", Integer.class, DEFAULT_DATASOURCE_MIN_IDLE); // 数据源最小连接数

        if (useJndi) {
            try {
                logger.debug("get datasource from jndi - [{}].", jndiName);
                Context ctx = new InitialContext();
                DataSource dataSource = (DataSource) ctx.lookup(jndiName);
                return dataSource;
            } catch (Exception e) {
                logger.error("get jndi datasource error", e);
            }
        } else {
            logger.debug("create druid datasource.");
            logger.debug("url - {}.", url);
            logger.debug("username - {}.", username);
            logger.debug("password - {}.", password);
            logger.debug("driverClass - {}.", driverClass);
            logger.debug("maxActive - {}.", maxActive);
            logger.debug("minIdle - {}.", minIdle);

            try {
                DruidDataSource datasource = new DruidDataSource();
                datasource.setUrl(url);
                datasource.setDriverClassName(driverClass);
                datasource.setUsername(username);
                datasource.setPassword(password);
                datasource.setInitialSize(minIdle);
                datasource.setMaxActive(maxActive);
                datasource.setMinIdle(minIdle);
                datasource.setFilters("stat,slf4j");
                datasource.setProxyFilters(getDruidFilters());
                return datasource;
            } catch (Exception e) {
                logger.error("create datasource error", e);
                e.printStackTrace();
            }
        }
        return null;
    }

    public List<Filter> getDruidFilters() {
        List<Filter> filters = new ArrayList<>();

        Slf4jLogFilter slf4jLogFilter = new Slf4jLogFilter();
        slf4jLogFilter.setDataSourceLogEnabled(false);
        slf4jLogFilter.setStatementLogEnabled(false);
        slf4jLogFilter.setStatementExecutableSqlLogEnable(true);
        slf4jLogFilter.setResultSetLogEnabled(false);
        slf4jLogFilter.setResultSetCloseAfterLogEnabled(false);
        slf4jLogFilter.setConnectionLogEnabled(false);

        filters.add(new StatFilter());
        filters.add(slf4jLogFilter);
        return filters;
    }

    @Bean
    public IdWorker idWorker() {
        return new IdWorker();
    }
}
