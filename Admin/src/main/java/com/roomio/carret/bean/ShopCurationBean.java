package com.roomio.carret.bean;

import java.util.List;

public class ShopCurationBean {
	private int shopExhiId;
	private String exhiName;
	private String exhiSub;
	private String exhiExplain;
	private String bannerImage;
	private List<ShopBean> curationList;
	
	
	public int getShopExhiId() {
		return shopExhiId;
	}
	public void setShopExhiId(int shopExhiId) {
		this.shopExhiId = shopExhiId;
	}
	public String getExhiName() {
		return exhiName;
	}
	public void setExhiName(String exhiName) {
		this.exhiName = exhiName;
	}
	public String getExhiSub() {
		return exhiSub;
	}
	public void setExhiSub(String exhiSub) {
		this.exhiSub = exhiSub;
	}
	public String getExhiExplain() {
		return exhiExplain;
	}
	public void setExhiExplain(String exhiExplain) {
		this.exhiExplain = exhiExplain;
	}
	public String getBannerImage() {
		return bannerImage;
	}
	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}
	public List<ShopBean> getCurationList() {
		return curationList;
	}
	public void setCurationList(List<ShopBean> curationList) {
		this.curationList = curationList;
	}
	
	
	
	
}
