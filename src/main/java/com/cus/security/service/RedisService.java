package com.cus.security.service;

import java.time.Duration;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import com.cus.security.config.JwtTokenUtil;
import com.cus.security.model.UserAndTokenDTO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


/**
 * 
 * @author Isaias
 *
 */
@Service
public class RedisService {

	Logger logger = LoggerFactory.getLogger(RedisService.class);
	
	@Autowired
	private JwtTokenUtil jwtUtil;
	
	@Value("${spring.redis.ttl}")
	private Long ttl;
	
	@Autowired
	private StringRedisTemplate redisTemplate;
	/**
	 * almacena el token y usuario en redis
	 * @param token
	 * @param username
	 * @return
	 */
	public Boolean saveToken(UserAndTokenDTO token) {
		try {
			logger.info("Save on redis was correct");
			String username = jwtUtil.getUsernameFromToken(token.getToken());
			logger.info(String.format("Username is %s", username));
			ValueOperations<String, String> valueOp= redisTemplate.opsForValue();	
			Gson gson =new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			valueOp.set(username, gson.toJson(token), Duration.ofMinutes(ttl));
			logger.info("Save on redis was correct");
			return Boolean.TRUE;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return Boolean.FALSE;
		}
		
	}
	public UserAndTokenDTO exisOnRedis(String username) {
		try {
			Gson gson = new Gson();
			ValueOperations<String, String> valueOp= redisTemplate.opsForValue();	
			String token = valueOp.get(username) ;
			logger.info("have --> " + token.toString());
			return token == null ? null : gson.fromJson(token ,UserAndTokenDTO.class);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
		
	}
	
	
}
