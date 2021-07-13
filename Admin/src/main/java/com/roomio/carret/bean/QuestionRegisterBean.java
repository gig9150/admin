package com.roomio.carret.bean;

public class QuestionRegisterBean {
	
	private String startDate;
	private String endDate;
	private int franchiseId;
	private int questionCategoryId;
	private int reportCategoryId;
	private int status;
	private String writer;
	private String writerInput;
	private String keyWord;
	private String keyWordInput;
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getFranchiseId() {
		return franchiseId;
	}
	public void setFranchiseId(int franchiseId) {
		this.franchiseId = franchiseId;
	}
	public int getQuestionCategoryId() {
		return questionCategoryId;
	}
	public void setQuestionCategoryId(int questionCategoryId) {
		this.questionCategoryId = questionCategoryId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWriterInput() {
		return writerInput;
	}
	public void setWriterInput(String writerInput) {
		this.writerInput = writerInput;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getKeyWordInput() {
		return keyWordInput;
	}
	public void setKeyWordInput(String keyWordInput) {
		this.keyWordInput = keyWordInput;
	}
	public int getReportCategoryId() {
		return reportCategoryId;
	}
	public void setReportCategoryId(int reportCategoryId) {
		this.reportCategoryId = reportCategoryId;
	}
	
}
