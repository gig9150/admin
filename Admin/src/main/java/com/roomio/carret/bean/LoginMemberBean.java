package com.roomio.carret.bean;

public class LoginMemberBean {
	
	private int member_id;
	private int franchise_id;
	private String name;
	private int status;
	private String main_image;
	private String area_name;
	private String member_code;
	
	//로그인 여부 
	private boolean isLogin;

	public LoginMemberBean() {
		this.isLogin = false;
	}

	
	public String getMember_code() {
		return member_code;
	}
	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public String getMain_image() {
		return main_image;
	}
	public void setMain_image(String main_image) {
		this.main_image = main_image;
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
