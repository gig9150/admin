package com.roomio.carret.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.ShopApplySearchBean;
import com.roomio.carret.bean.ShopSearchBean;
import com.roomio.carret.dao.ShopDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ShopService {
	
	@Value("${page.listCut}")
	private int listCnt;
	
	@Value("${page.paginationCnt}")
	private int paginationCnt;

	@Autowired
	private ShopDao shopDao;
	
	public List<HashMap<Object,Object>> getFranchiseName(){
		return shopDao.getFranchiseName();
	}
	
	public List<HashMap<Object,Object>> getAreaList(){
		return shopDao.getAreaList();
	}
	
	public List<HashMap<Object,Object>> getAreaSigunguList(int areaCode){
		return shopDao.getAreaSigunguList(areaCode);
	}
	
	public List<HashMap<Object,Object>> getAreaSigunguDefault(){
		return shopDao.getAreaSigunguDefault();
	}

	public PageBean getShopCnt(int page,ShopSearchBean shopSearchBean) {
		int roleGroupsCnt = shopDao.getShopCnt(shopSearchBean);
		PageBean pageBean = new PageBean(page,roleGroupsCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public int getShopRealCnt(ShopSearchBean shopSearchBean) {
		return shopDao.getShopCnt(shopSearchBean);
	}
	
	public List<HashMap<Object,Object>> getShopList(int page,ShopSearchBean shopSearchBean){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return shopDao.getShopList(shopSearchBean,rowBounds);
	}
	
	public PageBean getShopApplyCnt(int page,ShopApplySearchBean shopApplySearchBean) {
		int roleGroupsCnt = shopDao.getShopApplyCnt(shopApplySearchBean);
		PageBean pageBean = new PageBean(page,roleGroupsCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public List<HashMap<Object,Object>> getShopApplyList(int page,ShopApplySearchBean shopApplySearchBean){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return shopDao.getShopApplyList(shopApplySearchBean,rowBounds);
	}
	
	public HashMap<Object,Object> getApplyInfo(int shopIdx){
		return shopDao.getApplyInfo(shopIdx);
	}
	
	public void updateShopApplyInfo(HashMap<Object,Object> applyInfoMap) {
		shopDao.updateShopApplyInfo(applyInfoMap);
	}
	
	public List<String> getAttachedImg(int shopIdx){
		return shopDao.getAttachedImg(shopIdx);
	}
}
