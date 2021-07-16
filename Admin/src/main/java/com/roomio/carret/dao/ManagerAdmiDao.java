package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.ManagerAddBean;

@Repository
public class ManagerAdmiDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void addRoleGroups(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.managerAdmi.addRoleGroups",map);
	}
	
	public void addRoleGroupDetail(List<HashMap<Object,Object>> list) {
		sqlSessionTemplate.insert("com.roomio.carret.managerAdmi.addRoleGroupDetail",list);
	}
	
	public HashMap<Object,Object> getRoleInfo(int roleGroupId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.managerAdmi.getRoleInfo",roleGroupId);
	}
	
	public void updateRoleGroup(HashMap<Object,Object> upMap) {
		sqlSessionTemplate.update("com.roomio.carret.managerAdmi.updateRoleGroup",upMap);
	}
	
	public void deletRoleGroup(int roleGroupId) {
		sqlSessionTemplate.delete("com.roomio.carret.managerAdmi.deleteRoleGroup",roleGroupId);
	}
	
	public List<HashMap<Object,Object>> getRoleList(HashMap<Object,Object> map, RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.managerAdmi.getRoleList",map,rowBounds);
	}
	
	public int getRoleCnt(HashMap<Object,Object> map){
		return sqlSessionTemplate.selectOne("com.roomio.carret.managerAdmi.getRoleCnt",map);
	}
	
	public void deleteRole(int roleGroupId) {
		sqlSessionTemplate.delete("com.roomio.carret.managerAdmi.deleteRole",roleGroupId);
	}
	
	public void deleteAllRole(List<Integer> idList) {
		sqlSessionTemplate.delete("com.roomio.carret.managerAdmi.deleteAllRole",idList);
	}
	
	public List<HashMap<Object,Object>> getRoleName(){
		return sqlSessionTemplate.selectList("com.roomio.carret.managerAdmi.getRoleName");
	}
	
	public void managerRegister(ManagerAddBean bean) {
		sqlSessionTemplate.insert("com.roomio.carret.managerAdmi.managerRegister",bean);
	}
	
	public void managerFranRegister(List<HashMap<Object,Object>> list) {
		sqlSessionTemplate.insert("com.roomio.carret.managerAdmi.managerFranRegister",list);
	}
	
	public HashMap<Object,Object> getManagerInfo(int franchiseManagerId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.managerAdmi.getManagerInfo",franchiseManagerId);
	}
	
	public void updateManagerInfo(ManagerAddBean bean) {
		sqlSessionTemplate.update("com.roomio.carret.managerAdmi.updateManagerInfo",bean);
	}
	
	public void deleteManagerFran(int franchiseManagerId) {
		sqlSessionTemplate.delete("com.roomio.carret.managerAdmi.deleteManagerFran",franchiseManagerId);
	}
	
	public void deleteManager(int franchiseManagerId) {
		sqlSessionTemplate.delete("com.roomio.carret.managerAdmi.deleteManager",franchiseManagerId);
		
	}
	
	public List<HashMap<Object,Object>> getAccountList(HashMap<Object,Object> map,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.managerAdmi.getAccountList",map,rowBounds);
	}
	
	public int getAccountCnt(HashMap<Object,Object> map) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.managerAdmi.getAccountCnt",map);
	}
	
}
