package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.ShopApplySearchBean;
import com.roomio.carret.bean.ShopSearchBean;

@Repository
public class ShopDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<HashMap<Object,Object>> getFranchiseName(){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getFranchiseName");
	}
	
	public List<HashMap<Object,Object>> getAreaList(){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getAreaList");
	}
	
	public List<HashMap<Object,Object>> getAreaSigunguList(int areaCode){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getAreaSigunguList",areaCode);
	}
	
	public List<HashMap<Object,Object>> getAreaSigunguDefault(){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getAreaSigunguDefault");
	}
	
	public int getShopCnt(ShopSearchBean shopSearchBean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.getShopCnt",shopSearchBean);
	}
	
	public List<HashMap<Object,Object>> getShopList(ShopSearchBean shopSearchBean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getShopList",shopSearchBean,rowBounds);
	}
	
	public int getShopApplyCnt(ShopApplySearchBean shopApplySearchBean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.getShopApplyCnt",shopApplySearchBean);
	}
	
	public List<HashMap<Object,Object>> getShopApplyList(ShopApplySearchBean shopApplySearchBean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getShopApplyList",shopApplySearchBean,rowBounds);
	}
	
	public HashMap<Object,Object> getApplyInfo(int shopIdx){
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.getApplyInfo",shopIdx);
	}
	
	public void updateShopApplyInfo(HashMap<Object,Object> applyInfoMap) {
		sqlSessionTemplate.update("com.roomio.carret.shop.updateShopApplyInfo",applyInfoMap);
	}
	
	public List<String> getAttachedImg(int shopIdx){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getAttachedImg",shopIdx);
	}
	
}
