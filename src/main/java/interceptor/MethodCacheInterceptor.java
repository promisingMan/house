package interceptor;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import util.RedisUtil;

import java.util.List;

/**
 * Redis缓存过滤器
 *
 * @author 曾佳
 * @date 2019/3/7 21.37
 */
public class MethodCacheInterceptor implements MethodInterceptor {
    private Logger logger = LoggerFactory.getLogger(MethodCacheInterceptor.class);

    private RedisUtil redisUtil;

    /**
     * 禁用缓存的类名列表
     */
    private List<String> targetNamesList;
    /**
     * 禁用缓存的方法列表
     */
    private List<String> methodNamesList;
    /**
     * 缓存默认的过期时间
     */
    private String defaultCacheExpireTime;

    @Override
    public Object invoke(MethodInvocation invocation) throws Throwable {
        Object value = null;

        String targetName = invocation.getThis().getClass().getName();
        String methodName = invocation.getMethod().getName();

        logger.info("类:" + targetName);
        logger.info("方法:" + methodName);

        // 生成key
        String key = getCacheKey(targetName, methodName);

        if (isChangeData(methodName)) {
            // 如果是修改数据的方法，就清除缓存
            redisUtil.removePattern(targetName);
            return invocation.proceed();
        }

        if (!isAddCache(targetName, methodName)) {
            // 跳过缓存返回结果
            return invocation.proceed();
        }

        try {
            // 判断是否有缓存
            if (redisUtil.hasKey(key)) {
                return redisUtil.get(key);
            }
            // 写入缓存
            value = invocation.proceed();
            if (value != null) {
                final String cacheKey = key;
                final Object cacheValue = value;
                new Thread(() -> redisUtil.set(cacheKey, cacheValue, Long.parseLong(defaultCacheExpireTime))).start();
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (value == null) {
                return invocation.proceed();
            }
        }
        return value;
    }

    /**
     * 是否创建缓存
     *
     * @return
     */
    private boolean isAddCache(String targetName, String methodName) {
        boolean flag = true;
        if (targetNamesList.contains(targetName)
                || methodNamesList.contains(methodName) || targetName.contains("$$EnhancerBySpringCGLIB$$")) {
            flag = false;
        }
        return flag;
    }

    /**
     * 是否是 增，删，改 方法
     *
     * @param methodName
     * @return
     */
    private boolean isChangeData(String methodName) {
        return !StringUtils.startsWith(methodName, "get");
    }

    /**
     * 创建缓存key
     *
     * @param targetName
     * @param methodName
     */
    private String getCacheKey(String targetName, String methodName) {
        StringBuffer sb = new StringBuffer();
        sb.append(targetName).append("_").append(methodName);
        return sb.toString();
    }

    public void setRedisUtil(RedisUtil redisUtil) {
        this.redisUtil = redisUtil;
    }

    public void setTargetNamesList(List<String> targetNamesList) {
        this.targetNamesList = targetNamesList;
    }

    public void setMethodNamesList(List<String> methodNamesList) {
        this.methodNamesList = methodNamesList;
    }

    public void setDefaultCacheExpireTime(String defaultCacheExpireTime) {
        this.defaultCacheExpireTime = defaultCacheExpireTime;
    }
}