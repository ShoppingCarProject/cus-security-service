package com.cus.security.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.cus.security.service.ValidationService;

/**
 * 
 * @author Isaias
 *
 */
@RestController
@RequestMapping("/auth")
@CrossOrigin
public class ValidationController {

	@Autowired
	private ValidationService validation; 
	
	@PostMapping("/validate")
	public ResponseEntity<?> valid(@RequestHeader("Authorization") String  bearerToken){
		return validation.doAuthentication(bearerToken);
	}
	
  
}
