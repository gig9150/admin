package com.roomio.carret.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ShopApplySearchBean {
	
	private String dateData;
	private int franchiseId;
	private int areaId;
	private String nickName;
	private String representative;
	private String shopName;
	private String number;
	private int status;
	
	
	
	public String getDateData() {
		return dateData;
	}
	public void setDateData(String dateData) {
		this.dateData = dateData;
	}
	public int getFranchiseId() {
		return franchiseId;
	}
	public void setFranchiseId(int franchiseId) {
		this.franchiseId = franchiseId;
	}
	public int getAreaId() {
		return areaId;
	}
	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getRepresentative() {
		return representative;
	}
	public void setRepresentative(String representative) {
		this.representative = representative;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
