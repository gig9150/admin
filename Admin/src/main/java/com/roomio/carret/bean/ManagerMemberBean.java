package com.roomio.carret.bean;

public class ManagerMemberBean {
	
	//가맹사 관리자 인지 통합 관리자인지 확인하는 property 
	private boolean checkRole;
	//가맹점 관리자 property
	private String franchise_manager_code;
	private int role_group_id;
	private int status;
	private String access_date;
	//통합 관리자 property
	private int level;
	private String udate;
	
	//공통 property
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String regdate;
	
	public boolean isCheckRole() {
		return checkRole;
	}
	public void setCheckRole(boolean checkRole) {
		this.checkRole = checkRole;
	}
	public String getFranchise_manager_code() {
		return franchise_manager_code;
	}
	public void setFranchise_manager_code(String franchise_manager_code) {
		this.franchise_manager_code = franchise_manager_code;
	}
	public int getRole_group_id() {
		return role_group_id;
	}
	public void setRole_group_id(int role_group_id) {
		this.role_group_id = role_group_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getAccess_date() {
		return access_date;
	}
	public void setAccess_date(String access_date) {
		this.access_date = access_date;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getUdate() {
		return udate;
	}
	public void setUdate(String udate) {
		this.udate = udate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
}
