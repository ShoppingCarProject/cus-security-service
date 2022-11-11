package com.cus.security.service;

import org.hibernate.exception.JDBCConnectionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.cus.security.config.JwtTokenUtil;
import com.cus.security.model.Response;
import com.cus.security.model.StatusDTO;
import com.cus.security.model.UserAndTokenDTO;

@Service
public class ValidationService {

	Logger logger = LoggerFactory.getLogger(ValidationService.class);
	
	@Autowired
	private RedisService redisService;
	
	
	@Autowired
	private JwtTokenUtil jwtUtil;
	
	public ResponseEntity<?> doAuthentication(String token){
		try {
			if(token != null && !token.isEmpty()) {
				String token2 = token.trim().replace("Bearer", "").replace(" ", "");
				logger.info(token);
				UserAndTokenDTO tokenRedis =  redisService.exisOnRedis(jwtUtil.getUsernameFromToken(token2));
				logger.info(tokenRedis.getToken().toString());
				if(tokenRedis != null && tokenRedis.getToken().equals(token2)) {
					return ResponseEntity.ok(tokenRedis.getUser());
				}else {
					return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
				}
			}else {
				return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
			}			
		}catch (JDBCConnectionException conection) {
			conection.printStackTrace();
			return new ResponseEntity<Response>(new Response("500" , conection.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
		} 
		catch (Exception e) {
			logger.error(e.getMessage());
			return new ResponseEntity<Response>(new Response("500" , e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	
	}
}
