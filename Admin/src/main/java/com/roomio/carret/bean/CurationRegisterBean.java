package com.roomio.carret.bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CurationRegisterBean {

	private int shopExhiId;
	private int franchiseId;
	private int section;
	private String startDate;
	private String startAclock;
	private String endDate; 
	private String endAclock;
	private String curationTitle;
	private String curationSub;
	private int proStatus;
	private int openStatus;
	private String bannerImage;
	private MultipartFile uploadFile;
	private String url;
	private String curationInfo;
	
	
	public int getShopExhiId() {
		return shopExhiId;
	}
	public void setShopExhiId(int shopExhiId) {
		this.shopExhiId = shopExhiId;
	}
	public int getFranchiseId() {
		return franchiseId;
	}
	public void setFranchiseId(int franchiseId) {
		this.franchiseId = franchiseId;
	}
	
	public int getSection() {
		return section;
	}
	public void setSection(int section) {
		this.section = section;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStartAclock() {
		return startAclock;
	}
	public void setStartAclock(String startAclock) {
		this.startAclock = startAclock;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEndAclock() {
		return endAclock;
	}
	public void setEndAclock(String endAclock) {
		this.endAclock = endAclock;
	}
	public String getCurationTitle() {
		return curationTitle;
	}
	public void setCurationTitle(String curationTitle) {
		this.curationTitle = curationTitle;
	}
	public String getCurationSub() {
		return curationSub;
	}
	public void setCurationSub(String curationSub) {
		this.curationSub = curationSub;
	}
	public int getProStatus() {
		return proStatus;
	}
	public void setProStatus(int proStatus) {
		this.proStatus = proStatus;
	}
	public int getOpenStatus() {
		return openStatus;
	}
	public void setOpenStatus(int openStatus) {
		this.openStatus = openStatus;
	}
	public String getBannerImage() {
		return bannerImage;
	}
	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCurationInfo() {
		return curationInfo;
	}
	public void setCurationInfo(String curationInfo) {
		this.curationInfo = curationInfo;
	}
	
	
	
	
}
