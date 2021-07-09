package com.roomio.carret.bean;

import org.springframework.web.multipart.MultipartFile;

public class ShopRegisterBean {

	private int shopIdx; 
	private String memberName;
	private String buisnessNum;
	private String buisnessName;
	private String buisnessAddress;
	private String sector;
	private String shopName;
	private int memberId;
	private int franchiseId;
	private String latitude;
	private String longitude;
	private String address;
	private String shopCode;
	private String[] keyword;
	
	private String buisnessImageName;
	private MultipartFile uploadFile;
	
	
	public String getBuisnessImageName() {
		return buisnessImageName;
	}
	
	public void setBuisnessImageName(String buisnessImageName) {
		this.buisnessImageName = buisnessImageName;
	}
	
	public int getShopIdx() {
		return shopIdx;
	}
	public void setShopIdx(int shopIdx) {
		this.shopIdx = shopIdx;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getBuisnessNum() {
		return buisnessNum;
	}
	public void setBuisnessNum(String buisnessNum) {
		this.buisnessNum = buisnessNum;
	}
	public String getBuisnessName() {
		return buisnessName;
	}
	public void setBuisnessName(String buisnessName) {
		this.buisnessName = buisnessName;
	}
	public String getBuisnessAddress() {
		return buisnessAddress;
	}
	public void setBuisnessAddress(String buisnessAddress) {
		this.buisnessAddress = buisnessAddress;
	}
	public String getSector() {
		return sector;
	}
	public void setSector(String sector) {
		this.sector = sector;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String[] getKeyword() {
		return keyword;
	}
	public void setKeyword(String[] keyword) {
		this.keyword = keyword;
	}
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getFranchiseId() {
		return franchiseId;
	}
	public void setFranchiseId(int franchiseId) {
		this.franchiseId = franchiseId;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getShopCode() {
		return shopCode;
	}
	public void setShopCode(String shopCode) {
		this.shopCode = shopCode;
	}
	
	
	
}
