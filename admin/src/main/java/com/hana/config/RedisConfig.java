package com.hana.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;

//configration은 실행 시 기본적으로 거치는.. 그것
@Configuration
public class RedisConfig {
    @Value("${spring.session.data.redis.host}")
    private String redisHost;

    @Value("${spring.session.data.redis.port}")
    private int redisPort;

    @Value("${spring.session.data.redis.password}")
    private String redisPwd;

    @Bean
    public RedisConnectionFactory redisConnectionFactory() {
        RedisStandaloneConfiguration redisStandaloneConfiguration = new RedisStandaloneConfiguration(redisHost, redisPort);
        redisStandaloneConfiguration.setPassword(redisPwd);
        return new LettuceConnectionFactory(redisStandaloneConfiguration);
    }


}