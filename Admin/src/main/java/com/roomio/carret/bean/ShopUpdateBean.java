package com.roomio.carret.bean;

public class ShopUpdateBean {
	
	private String shopName;
	private int shopIdx;
	private int activityStatus;
	private String register;
	private String memo;
	private String buisnessName;
	private int buisnessNum;
	private int sectorId;
	private String sectorContent;
	private String name;
	private int memberId;
	
	
	public int getShopIdx() {
		return shopIdx;
	}
	public void setShopIdx(int shopIdx) {
		this.shopIdx = shopIdx;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public int getActivityStatus() {
		return activityStatus;
	}
	public void setActivityStatus(int activityStatus) {
		this.activityStatus = activityStatus;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getBuisnessName() {
		return buisnessName;
	}
	public void setBuisnessName(String buisnessName) {
		this.buisnessName = buisnessName;
	}
	public int getBuisnessNum() {
		return buisnessNum;
	}
	public void setBuisnessNum(int buisnessNum) {
		this.buisnessNum = buisnessNum;
	}
	public int getSectorId() {
		return sectorId;
	}
	public void setSectorId(int sectorId) {
		this.sectorId = sectorId;
	}
	public String getSectorContent() {
		return sectorContent;
	}
	public void setSectorContent(String sectorContent) {
		this.sectorContent = sectorContent;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	
}
