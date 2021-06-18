package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.ManagerRegisterBean;

@Repository
public class ManagerAccountDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<HashMap<String,String>> getFranchiseList(){
		return sqlSessionTemplate.selectList("com.roomio.carret.managerAccount.getFranchiseList");
	}
	
	public List<HashMap<String,String>> getRoleGroupsList(){
		return sqlSessionTemplate.selectList("com.roomio.carret.managerAccount.getRoleGroupsList");
	}
	
	public List<HashMap<String,String>> getAdditionalRole(){
		return sqlSessionTemplate.selectList("com.roomio.carret.managerAccount.getAdditionalRole");
	}
	
	public String idExistCheck(String id) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.managerAccount.idExistCheck",id);
	}
	
	public void managerRegister(ManagerRegisterBean managerRegisterBean) {
		sqlSessionTemplate.insert("com.roomio.carret.managerAccount.managerRegister",managerRegisterBean);
	}
	
	public void addAdditionalRole(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.managerAccount.addAdditionalRole",map);
	}
	
	public int getManagerCnt(HashMap<Object,Object> map) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.managerAccount.getManagerCnt",map);
	}
	
	public List<HashMap<Object,Object>> getManagerList(HashMap<Object,Object> map,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.managerAccount.getManagerList",map,rowBounds);
	}
	
	public void deleteManagerAddtionalRole(int franchiseManagerId) {
		sqlSessionTemplate.delete("com.roomio.carret.managerAccount.deleteManagerAddtionalRole",franchiseManagerId);
	}
	
	public void deleteManager(int franchiseManagerId) {
		sqlSessionTemplate.delete("com.roomio.carret.managerAccount.deleteManager",franchiseManagerId);
	}
	
	public int getManagerAccessCnt(HashMap<Object,Object> map) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.managerAccount.getManagerAccessCnt",map);
	}
	
	public List<HashMap<Object,Object>> getManagerAccessList(HashMap<Object,Object> map,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.managerAccount.getManagerAccessList",map,rowBounds);
	}
	
	public HashMap<Object,Object> getUpdateManagerInfo(int franchiseManagerId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.managerAccount.getUpdateManagerInfo",franchiseManagerId);
	}
	
	public void updateManagerInfo(ManagerRegisterBean managerRegisterBean) {
		sqlSessionTemplate.update("com.roomio.carret.managerAccount.updateManagerInfo",managerRegisterBean);
	}
	
	

}
