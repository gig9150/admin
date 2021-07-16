package com.roomio.carret.bean;

public class ManagerAddBean {

	private int franchiseManagerId;
	private String franchiseManagerCode;
	private String name;
	private int status;
	private String id;
	private String pw;
	private String phone;
	private String email;
	private int roleGroupId;
	private int excel;
	
	
	public String getFranchiseManagerCode() {
		return franchiseManagerCode;
	}
	public void setFranchiseManagerCode(String franchiseManagerCode) {
		this.franchiseManagerCode = franchiseManagerCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getFranchiseManagerId() {
		return franchiseManagerId;
	}
	public void setFranchiseManagerId(int franchiseManagerId) {
		this.franchiseManagerId = franchiseManagerId;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getRoleGroupId() {
		return roleGroupId;
	}
	public void setRoleGroupId(int roleGroupId) {
		this.roleGroupId = roleGroupId;
	}
	public int getExcel() {
		return excel;
	}
	public void setExcel(int excel) {
		this.excel = excel;
	}
	
	
}
