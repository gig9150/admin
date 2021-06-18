package com.roomio.carret.bean;

public class SearchBean {

	private String searchOption;
	private String keyWord;
	
	public SearchBean() {};
	
	public SearchBean(String searchOption, String keyWord) {
		super();
		this.searchOption = searchOption;
		this.keyWord = keyWord;
	}
	
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	
}
