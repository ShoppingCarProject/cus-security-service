package com.cus.security.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cus.security.config.JwtTokenUtil;
import com.cus.security.dao.UserDao;
import com.cus.security.model.JwtRequest;
import com.cus.security.model.JwtResponse;
import com.cus.security.model.Response;
import com.cus.security.model.UserAndTokenDTO;
import com.cus.security.model.UserDTO;
import com.cus.security.service.RedisService;
import com.google.gson.Gson;
import com.cus.security.service.JwtUserDetailsService;

@RestController
@RequestMapping("/login")
@CrossOrigin
public class JwtAuthenticationController {

	Logger logger = LoggerFactory.getLogger(JwtAuthenticationController.class);
	
	@Autowired 
	private UserDao userDao;
	
	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private JwtTokenUtil jwtTokenUtil;

	@Autowired
	private JwtUserDetailsService userDetailsService;
	
	@Autowired
	private RedisService autenticationCache;

	/**
	 * Autenticacion por usuario y clave.
	 * @param authenticationRequest
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/authenticate", method = RequestMethod.POST)
	public ResponseEntity<?> createAuthenticationToken(@RequestBody JwtRequest authenticationRequest) throws Exception {
		authenticate(authenticationRequest.getUsername(), authenticationRequest.getPassword());
		final UserDetails userDetails = userDetailsService.loadUserByUsername(authenticationRequest.getUsername());
		UserAndTokenDTO redisToken = autenticationCache.exisOnRedis(authenticationRequest.getUsername());
		if(redisToken!= null ) {
			
			return ResponseEntity.ok(redisToken);
		}else {
			final String token = jwtTokenUtil.generateToken(userDetails);
			UserAndTokenDTO redisData = new UserAndTokenDTO();
			redisData.setToken(token);
			redisData.setUser(userDao.findByUsername(authenticationRequest.getUsername()));
			autenticationCache.saveToken(redisData);
			logger.info("Login ok");
			return ResponseEntity.ok(redisData);
		}
		
	}
	/**
	 * Registro de nuevos usuarios.
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<?> saveUser(@RequestBody UserDTO user) throws Exception {
		try {
			try {
				UserDetails userD = userDetailsService.loadUserByUsername(user.getUsername());
				if(userD != null) {
					return new ResponseEntity<Response>(new Response("500" , user.getUsername() +  " already exist!") , HttpStatus.NOT_ACCEPTABLE);
				}else {
					return ResponseEntity.ok(userDetailsService.save(user));
				}
			} catch (UsernameNotFoundException e) {
				return ResponseEntity.ok(userDetailsService.save(user));
			}		
		} catch (Exception e) {
			 e.printStackTrace();
			return new ResponseEntity<Response>(new Response("500" , e.getMessage()) , HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}

	private void authenticate(String username, String password) throws Exception {
		try {
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));		
		} catch (DisabledException e) {
			throw new Exception("USER_DISABLED", e);
		} catch (BadCredentialsException e) {
			throw new Exception("INVALID_CREDENTIALS", e);
		}
	}
}