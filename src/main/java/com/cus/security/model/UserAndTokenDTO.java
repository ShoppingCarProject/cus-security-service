package com.cus.security.model;

public class UserAndTokenDTO {

	private String token;
	private DAOUser user;
	
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public DAOUser getUser() {
		return user;
	}
	public void setUser(DAOUser user) {
		this.user = user;
	}
	
	
}
