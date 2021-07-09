package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.CurationRegisterBean;
import com.roomio.carret.bean.CurationSearchBean;

@Repository
public class ExhibitionDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getCurationCnt(CurationSearchBean curationSearchBean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.exhibition.getCurationCnt",curationSearchBean);
	}
	
	public List<HashMap<Object,Object>> getCurationList(CurationSearchBean curationSearchBean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.exhibition.getCurationList",curationSearchBean,rowBounds);
	}
	
	public String checkUrlExist(String url) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.exhibition.checkUrlExist",url);
	}
	
	public void addNewCuration(CurationRegisterBean curationRegisterBean) {
		sqlSessionTemplate.insert("com.roomio.carret.exhibition.addNewCuration",curationRegisterBean);
	}
	
	public void addCurationShop(List<HashMap<Object,Object>> curationList) {
		sqlSessionTemplate.insert("com.roomio.carret.exhibition.addCurationShop",curationList);
	}
	
	public HashMap<Object,Object> getExhibition(int shopExhiId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.exhibition.getExhibition",shopExhiId);
	}
	
	public void updateCuration(CurationRegisterBean curationRegisterBean) {
		sqlSessionTemplate.update("com.roomio.carret.exhibition.updateCuration",curationRegisterBean);
	}
	
	public void deleteCuration(int shopExhiId) {
		sqlSessionTemplate.delete("com.roomio.carret.exhibition.deleteCuration",shopExhiId);
	}
	
}
