package com.roomio.carret.bean;

public class LoginManagerBean {

	private int franchise_manager_id;
	private int franchise_id;
	private String franchise_manager_code;
	private int status;
	private String id;
	private String pw;
	private String name;
	
	private boolean islogin;
	
	public LoginManagerBean() {
		this.islogin = false;
	}

	public int getFranchise_manager_id() {
		return franchise_manager_id;
	}

	public void setFranchise_manager_id(int franchise_manager_id) {
		this.franchise_manager_id = franchise_manager_id;
	}

	public int getFranchise_id() {
		return franchise_id;
	}

	public void setFranchise_id(int franchise_id) {
		this.franchise_id = franchise_id;
	}

	public String getFranchise_manager_code() {
		return franchise_manager_code;
	}

	public void setFranchise_manager_code(String franchise_manager_code) {
		this.franchise_manager_code = franchise_manager_code;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isIslogin() {
		return islogin;
	}

	public void setIslogin(boolean islogin) {
		this.islogin = islogin;
	}
	
	
	
}
