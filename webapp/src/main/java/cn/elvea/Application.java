package cn.elvea;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
public class Application {
    // 应用是否启用调试模式
    private boolean debug = false;

    // 系统环境变量
    private Environment env = null;

    @Autowired
    public Application(Environment env) {
        this.env = env;

        debug = getProperty("app.debug", Boolean.class, false);
    }

    // 获取当前系统是否是调试模式
    public boolean isDebug() {
        return debug;
    }

    public String getProperty(String key) {
        return env.getProperty(key);
    }

    public String getProperty(String key, String defaultValue) {
        return env.getProperty(key, defaultValue);
    }

    public <T> T getProperty(String key, Class<T> clazz) {
        return env.getProperty(key, clazz);
    }

    public <T> T getProperty(String key, Class<T> clazz, T defaultValue) {
        return env.getProperty(key, clazz, defaultValue);
    }
}
