package com.roomio.carret.bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProfileUpdateBean {
	
	private MultipartFile uploadFile;
	private List<MultipartFile> mulUploadFile;
	private String mainImage;
	
	private int shopIdx;
	private String shopName;
	private int area;
	
	private List<String> keyword;

	
	public int getShopIdx() {
		return shopIdx;
	}
	public void setShopIdx(int shopIdx) {
		this.shopIdx = shopIdx;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public List<MultipartFile> getMulUploadFile() {
		return mulUploadFile;
	}
	public void setMulUploadFile(List<MultipartFile> mulUploadFile) {
		this.mulUploadFile = mulUploadFile;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public List<String> getKeyword() {
		return keyword;
	}
	public void setKeyword(List<String> keyword) {
		this.keyword = keyword;
	}
	
}
