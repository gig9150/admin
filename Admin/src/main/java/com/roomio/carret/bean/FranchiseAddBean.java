package com.roomio.carret.bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FranchiseAddBean {
	
	private int franchiseId;
	private String franchiseCode;
	private String franchiseName;
	private String address;
	private String customerService;
	private String memo;
	private String serviceStatus;
	private String pointColor;
	private String logoFile;
	private MultipartFile uploadFile;
	private String serviceName;
	private String shopService;
	private int shopServiceInt;
	private int shopApproval;
	private String dailyService;
	private int dailyServiceInt;
	private int dailyApproval;
	private String usedService;
	private int usedServiceInt;
	private int usedApproval;
	private String directTradeService;
	private int directTradeServiceInt; 
	private int directTradeApproval;
	
	
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getFranchiseCode() {
		return franchiseCode;
	}
	public void setFranchiseCode(String franchiseCode) {
		this.franchiseCode = franchiseCode;
	}
	public int getFranchiseId() {
		return franchiseId;
	}
	public void setFranchiseId(int franchiseId) {
		this.franchiseId = franchiseId;
	}
	public String getFranchiseName() {
		return franchiseName;
	}
	public void setFranchiseName(String franchiseName) {
		this.franchiseName = franchiseName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCustomerService() {
		return customerService;
	}
	public void setCustomerService(String customerService) {
		this.customerService = customerService;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getServiceStatus() {
		return serviceStatus;
	}
	public void setServiceStatus(String serviceStatus) {
		this.serviceStatus = serviceStatus;
	}
	public String getPointColor() {
		return pointColor;
	}
	public void setPointColor(String pointColor) {
		this.pointColor = pointColor;
	}
	public String getLogoFile() {
		return logoFile;
	}
	public void setLogoFile(String logoFile) {
		this.logoFile = logoFile;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getShopService() {
		return shopService;
	}
	public void setShopService(String shopService) {
		this.shopService = shopService;
	}
	public int getShopServiceInt() {
		return shopServiceInt;
	}
	public void setShopServiceInt(int shopServiceInt) {
		this.shopServiceInt = shopServiceInt;
	}
	public int getShopApproval() {
		return shopApproval;
	}
	public void setShopApproval(int shopApproval) {
		this.shopApproval = shopApproval;
	}
	public String getDailyService() {
		return dailyService;
	}
	public void setDailyService(String dailyService) {
		this.dailyService = dailyService;
	}
	public int getDailyServiceInt() {
		return dailyServiceInt;
	}
	public void setDailyServiceInt(int dailyServiceInt) {
		this.dailyServiceInt = dailyServiceInt;
	}
	public int getDailyApproval() {
		return dailyApproval;
	}
	public void setDailyApproval(int dailyApproval) {
		this.dailyApproval = dailyApproval;
	}
	public String getUsedService() {
		return usedService;
	}
	public void setUsedService(String usedService) {
		this.usedService = usedService;
	}
	public int getUsedServiceInt() {
		return usedServiceInt;
	}
	public void setUsedServiceInt(int usedServiceInt) {
		this.usedServiceInt = usedServiceInt;
	}
	public int getUsedApproval() {
		return usedApproval;
	}
	public void setUsedApproval(int usedApproval) {
		this.usedApproval = usedApproval;
	}
	public String getDirectTradeService() {
		return directTradeService;
	}
	public void setDirectTradeService(String directTradeService) {
		this.directTradeService = directTradeService;
	}
	public int getDirectTradeServiceInt() {
		return directTradeServiceInt;
	}
	public void setDirectTradeServiceInt(int directTradeServiceInt) {
		this.directTradeServiceInt = directTradeServiceInt;
	}
	public int getDirectTradeApproval() {
		return directTradeApproval;
	}
	public void setDirectTradeApproval(int directTradeApproval) {
		this.directTradeApproval = directTradeApproval;
	}
	
}
