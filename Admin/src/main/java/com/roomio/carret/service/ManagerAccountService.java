package com.roomio.carret.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.roomio.carret.bean.ManagerRegisterBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.SearchBean;
import com.roomio.carret.dao.ManagerAccountDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ManagerAccountService {
	
	@Value("${page.listCut}")
	private int listCnt;
	
	@Value("${page.paginationCnt}")
	private int paginationCnt;

	@Autowired
	private ManagerAccountDao managerAccountDao;
	
	public List<HashMap<String,String>> getFranchiseList(){
		return managerAccountDao.getFranchiseList();
	}
	
	public List<HashMap<String,String>> getRoleGroupsList(){
		return managerAccountDao.getRoleGroupsList();
	}
	
	public List<HashMap<String,String>> getAdditionalRole(){
		return managerAccountDao.getAdditionalRole();
	}
	
	public boolean idExistCheck(String id) {
		String checkId =  managerAccountDao.idExistCheck(id);
		if(checkId != null) {
			return true;
		}else {
			return false;
		}
	}
	
	public void managerRegister(ManagerRegisterBean managerRegisterBean) {
		managerAccountDao.managerRegister(managerRegisterBean);
	}
	
	public void addAdditionalRole(HashMap<Object,Object> map) {
		managerAccountDao.addAdditionalRole(map);
	}
	
	public PageBean getManagerCnt(int page,HashMap<Object,Object> map) {
		int roleGroupsCnt = managerAccountDao.getManagerCnt(map);
		PageBean pageBean = new PageBean(page,roleGroupsCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public List<HashMap<Object,Object>> getManagerList(int page,HashMap<Object,Object> map){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return managerAccountDao.getManagerList(map,rowBounds);
	}
	
	public void deleteManager(int franchiseManagerId) {
		managerAccountDao.deleteManagerAddtionalRole(franchiseManagerId);
		managerAccountDao.deleteManager(franchiseManagerId);
	}
	
	public PageBean getManagerAccessCnt(int page,HashMap<Object,Object> map) {
		int roleGroupsCnt = managerAccountDao.getManagerAccessCnt(map);
		PageBean pageBean = new PageBean(page,roleGroupsCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public List<HashMap<Object,Object>> getManagerAccessList(int page,HashMap<Object,Object> map){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return managerAccountDao.getManagerAccessList(map,rowBounds);
	}	
	
	public HashMap<Object,Object> getUpdateManagerInfo(int franchiseManagerId){
		return managerAccountDao.getUpdateManagerInfo(franchiseManagerId);
	}
	
	public void updateManagerInfo(ManagerRegisterBean managerRegisterBean,String[] roleDetail) {
		
		//계정 정보 수정 
		managerAccountDao.updateManagerInfo(managerRegisterBean);
		
		//계정 추가 권한 삭제
		managerAccountDao.deleteManagerAddtionalRole(managerRegisterBean.getFranchiseManagerId());
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		
		if(roleDetail != null) {
			//계정에 추가 권한 부여 
			for(String additionalRoleId : roleDetail) {
				map.put("managerId", managerRegisterBean.getFranchiseManagerId());
				map.put("additionalRoleId",additionalRoleId);
				managerAccountDao.addAdditionalRole(map);
			}
		}
	}

}
