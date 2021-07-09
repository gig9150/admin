package com.roomio.carret.bean;

import org.springframework.web.multipart.MultipartFile;

public class MemberRegisterBean {
	
	private String memberCode;
	private int franchise_id;
	private int id;
	private String name;
	private String profileImage;
	private String address;
	
	private MultipartFile uploadFile;
	
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getFranchise_id() {
		return franchise_id;
	}
	public void setFranchise_id(int franchise_id) {
		this.franchise_id = franchise_id;
	}
	
	
	
	
}
