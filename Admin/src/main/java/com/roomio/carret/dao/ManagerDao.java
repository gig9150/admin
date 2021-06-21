package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.FranchiseRegisterBean;
import com.roomio.carret.bean.RoleGroupsBean;
import com.roomio.carret.bean.SearchBean;

@Repository
public class ManagerDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public String checkManagerMember(HashMap<String,String> map) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.manager.checkManagerMember",map);
	}

	public List<HashMap<String,String>> getRoleDetailList(){
		return sqlSessionTemplate.selectList("com.roomio.carret.manager.getRoleDetailList");
	}
	
	public void addRoleGroups(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.manager.addRoleGroups",map);
	}

	public void addRoleGroupsDetail(HashMap<Object,Object> detailMap) {
		sqlSessionTemplate.insert("com.roomio.carret.manager.addRoleGroupsDetail",detailMap);
	}
	
	public int getRoleGroupsCnt(SearchBean searchBean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.manager.getRoleGroupsCnt",searchBean);
	}
	
	public List<HashMap<String,String>> getRoleGroupsList(SearchBean searchBean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.manager.getRoleGroupsList",searchBean,rowBounds);
	}
	
	public void deleteRoleGroups(int roleGroupId) {
		sqlSessionTemplate.delete("com.roomio.carret.manager.deleteRoleGroups",roleGroupId);
	}
	
	public void deleteRoleGroupsDetail(int roleGroupId) {
		sqlSessionTemplate.delete("com.roomio.carret.manager.deleteRoleGroupsDetail",roleGroupId);
	}
	
	public int getFranchiseCnt(String keyWord) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.manager.getFranchiseCnt",keyWord);
	}
	
	public List<FranchiseRegisterBean> getFranchiseList(String keyWord,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.manager.getFranchiseList",keyWord,rowBounds);
	}
	
	public void addFranchise(FranchiseRegisterBean registerBean) {
		sqlSessionTemplate.insert("com.roomio.carret.manager.addFranchise",registerBean);
	}
	
	public void addFranchiseManager(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.manager.addFranchiseManager",map);
	}
	
	public void addFranchiseDomain(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.manager.addFranchiseDomain",map);
	}
	
	public HashMap<Object,Object> updateGetRoleGroup(int roleGroupId) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.manager.updateGetRoleGroup",roleGroupId);
	}
	
	public List<String> getRoleGroupDetail(int roleGroupId) {
		return sqlSessionTemplate.selectList("com.roomio.carret.manager.getRoleGroupDetail",roleGroupId);
	}
	
	public void updateRoleGroups(HashMap<Object,Object> groupsMap) {
		sqlSessionTemplate.update("com.roomio.carret.manager.updateRoleGroups",groupsMap);
	}
	
	public String getNowLogoFile(int FranchiseId) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.manager.getNowLogoFile",FranchiseId);
	}
	
	public void updateFranchise(FranchiseRegisterBean registerBean) {
		sqlSessionTemplate.update("com.roomio.carret.manager.updateFranchise",registerBean);
	}
	
	public void updateFranchiseManager(HashMap<Object,Object> map) {
		sqlSessionTemplate.update("com.roomio.carret.manager.updateFranchiseManager",map);
	}
	
	public void deleteFranchiseDomain(int franchiseId) {
		sqlSessionTemplate.delete("com.roomio.carret.manager.deleteFranchiseDomain",franchiseId);
	}
	
	
}
