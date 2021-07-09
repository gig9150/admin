package com.roomio.carret.bean;

import org.springframework.web.multipart.MultipartFile;

public class ManagerNoticeRegisterBean {

	private int managerNoticeId;
	private int franchiseManagerId;
	private String noticeTitle;
	private String noticeContent;
	private String oriAttachFile;
	private String attachFile;
	private MultipartFile uploadFile;
	
	
	
	public String getOriAttachFile() {
		return oriAttachFile;
	}
	public void setOriAttachFile(String oriAttachFile) {
		this.oriAttachFile = oriAttachFile;
	}
	public int getManagerNoticeId() {
		return managerNoticeId;
	}
	public void setManagerNoticeId(int managerNoticeId) {
		this.managerNoticeId = managerNoticeId;
	}
	public int getFranchiseManagerId() {
		return franchiseManagerId;
	}
	public void setFranchiseManagerId(int franchiseManagerId) {
		this.franchiseManagerId = franchiseManagerId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(String attachFile) {
		this.attachFile = attachFile;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	

}
