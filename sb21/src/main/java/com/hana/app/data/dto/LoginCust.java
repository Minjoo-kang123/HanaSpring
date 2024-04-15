package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

import java.time.LocalDateTime;

//redis에 저장될 객체 @Id 인식 객체값이 된다.
@RedisHash(value = "logincust", timeToLive = 600)
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class LoginCust {
    @Id
    private String loginId;

}