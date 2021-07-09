package com.roomio.carret.bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FranchiseRegisterBean {
	
	private int franchiseId;
	private String franchiseCode;
	private String id;
	private String pw;
	private String serviceName;
	private String serviceStatus;
	private String mainDomain;
	private String logoFile;
	private String pointColor;
	private String franchiseName;
	private String representativeName;
	private String businessNumber;
	private String address;
	private String phone_number;
	private String fax;
	private String responsibilityName;
	private String responsibilityDepa;
	private String responsibilityPosition;
	private String responsibilityNumber;
	private String responsibilityPhone;
	private String responsibilityEmail;
	private String memo;
	private String regdate;
	private String customerService;
	
	//파일 업로드 객체
	private MultipartFile uploadFile;
	
	//서브도메인 객체 
	private List<String> subDomainList;
	
	
	public String getCustomerService() {
		return customerService;
	}
	public void setCustomerService(String customerService) {
		this.customerService = customerService;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
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
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getServiceStatus() {
		return serviceStatus;
	}
	public void setServiceStatus(String serviceStatus) {
		this.serviceStatus = serviceStatus;
	}
	public String getMainDomain() {
		return mainDomain;
	}
	public void setMainDomain(String mainDomain) {
		this.mainDomain = mainDomain;
	}
	public String getLogoFile() {
		return logoFile;
	}
	public void setLogoFile(String logoFile) {
		this.logoFile = logoFile;
	}
	public String getPointColor() {
		return pointColor;
	}
	public void setPointColor(String pointColor) {
		this.pointColor = pointColor;
	}
	public String getFranchiseName() {
		return franchiseName;
	}
	public void setFranchiseName(String franchiseName) {
		this.franchiseName = franchiseName;
	}
	public String getRepresentativeName() {
		return representativeName;
	}
	public void setRepresentativeName(String representativeName) {
		this.representativeName = representativeName;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getResponsibilityName() {
		return responsibilityName;
	}
	public void setResponsibilityName(String responsibilityName) {
		this.responsibilityName = responsibilityName;
	}
	public String getResponsibilityDepa() {
		return responsibilityDepa;
	}
	public void setResponsibilityDepa(String responsibilityDepa) {
		this.responsibilityDepa = responsibilityDepa;
	}
	public String getResponsibilityPosition() {
		return responsibilityPosition;
	}
	public void setResponsibilityPosition(String responsibilityPosition) {
		this.responsibilityPosition = responsibilityPosition;
	}
	public String getResponsibilityNumber() {
		return responsibilityNumber;
	}
	public void setResponsibilityNumber(String responsibilityNumber) {
		this.responsibilityNumber = responsibilityNumber;
	}
	public String getResponsibilityPhone() {
		return responsibilityPhone;
	}
	public void setResponsibilityPhone(String responsibilityPhone) {
		this.responsibilityPhone = responsibilityPhone;
	}
	public String getResponsibilityEmail() {
		return responsibilityEmail;
	}
	public void setResponsibilityEmail(String responsibilityEmail) {
		this.responsibilityEmail = responsibilityEmail;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getFranchiseId() {
		return franchiseId;
	}
	public void setFranchiseId(int franchiseId) {
		this.franchiseId = franchiseId;
	}
	public String getFranchiseCode() {
		return franchiseCode;
	}
	public void setFranchiseCode(String franchiseCode) {
		this.franchiseCode = franchiseCode;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public List<String> getSubDomainList() {
		return subDomainList;
	}
	public void setSubDomainList(List<String> subDomainList) {
		this.subDomainList = subDomainList;
	}
	
	
}
