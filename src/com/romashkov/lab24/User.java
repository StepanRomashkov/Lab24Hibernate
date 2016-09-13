package com.romashkov.lab24;

import org.jasypt.util.password.rfc2307.RFC2307SSHAPasswordEncryptor;

public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private String fullName;
	
	public int getId() {
		return id;
	}
	
	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getEmail() {
		return email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	public void encryptPassword() {
		RFC2307SSHAPasswordEncryptor crypto = new RFC2307SSHAPasswordEncryptor();
		setPassword(crypto.encryptPassword(getPassword()));
	}
	
	public boolean checkUserPass(String plainPass, String encryptedPass) {
		RFC2307SSHAPasswordEncryptor crypto = new RFC2307SSHAPasswordEncryptor();
		return crypto.checkPassword(plainPass, encryptedPass);
	}
	
}
