package com.roomio.carret.bean;

public class LoginMemberBean {
	
	private int member_id;
	private int franchise_id;
	private String name;
	private int status;
	
	//로그인 여부 
	private boolean isLogin;
	
	public LoginMemberBean() {
		this.isLogin = false;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getFranchise_id() {
		return franchise_id;
	}

	public void setFranchise_id(int franchise_id) {
		this.franchise_id = franchise_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public boolean isLogin() {
		return isLogin;
	}

	public void setLogin(boolean isLogin) {
		this.isLogin = isLogin;
	}
	
	
	
	
	
}
