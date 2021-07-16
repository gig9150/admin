package com.roomio.carret.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.roomio.carret.bean.FranchiseRegisterBean;
import com.roomio.carret.bean.ManagerAddBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.QuestionRegisterBean;
import com.roomio.carret.dao.ManagerAdmiDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ManagerAdmiService {

	@Autowired
	private ManagerAdmiDao managerAdmiDao;
	
	@Value("${page.listCut}")
	private int listCnt;
	
	@Value("${page.paginationCnt}")
	private int paginationCnt;
	
	@Value("${path.upload}")
	private String pathUpload;

	public void addRoleGroups(String roleGroupName, String roleGroupInfo, int[] crud, int[] role, String registrar) {
		List<HashMap<Object, Object>> deList = new ArrayList<HashMap<Object, Object>>();
		HashMap<Object, Object> addMap = new HashMap<Object, Object>();
		addMap.put("roleGroupName", roleGroupName);
		addMap.put("roleGroupInfo", roleGroupInfo);
		addMap.put("registrar", registrar);

		// 역할 등록
		managerAdmiDao.addRoleGroups(addMap);
		
		for (int i = 0; i < role.length; i++) {
			for (int j = 0; j < crud.length; j++) {
				HashMap<Object, Object> deMap = new HashMap<Object, Object>();
				deMap.put("roleGroupId", (int) addMap.get("roleGroupId"));
				deMap.put("detailRole", role[i]);
				deMap.put("crud", crud[j]);
				deList.add(deMap);
			}
		}
		

		// 역할 상세 등록
		managerAdmiDao.addRoleGroupDetail(deList);

	}

	public HashMap<Object, Object> getRoleInfo(int roleGroupId) {

		return managerAdmiDao.getRoleInfo(roleGroupId);

	}

	public void updateRoleGroups(String roleGroupName, String roleGroupInfo, int[] crud, int[] role, String registrar,int roleGroupId) {
		
		List<HashMap<Object, Object>> deList = new ArrayList<HashMap<Object, Object>>();
		HashMap<Object, Object> upMap = new HashMap<Object, Object>();
		upMap.put("roleGroupName", roleGroupName);
		upMap.put("roleGroupInfo", roleGroupInfo);
		upMap.put("registrar", registrar);
		upMap.put("roleGroupId",roleGroupId);

		// 역할 등록
		managerAdmiDao.updateRoleGroup(upMap);
		
		// 역할 상세 삭제 
		managerAdmiDao.deletRoleGroup(roleGroupId);

		for (int i = 0; i < role.length; i++) {
			for (int j = 0; j < crud.length; j++) {
				HashMap<Object, Object> deMap = new HashMap<Object, Object>();
				deMap.put("roleGroupId", roleGroupId);
				deMap.put("detailRole", role[i]);
				deMap.put("crud", crud[j]);
				deList.add(deMap);
			}
		}

		// 역할 상세 등록
		managerAdmiDao.addRoleGroupDetail(deList);

	}
	
	public List<HashMap<Object,Object>> getRoleList(int page,HashMap<Object,Object> map,int selectNum){
		int start = (page - 1) * selectNum;
		RowBounds rowBounds = new RowBounds(start,selectNum);
		return managerAdmiDao.getRoleList(map,rowBounds);
	}
	
	public PageBean getRoleCnt(int page,HashMap<Object,Object> map,int selectNum) {
		int roleCnt = managerAdmiDao.getRoleCnt(map);
		PageBean pageBean = new PageBean(page,roleCnt,selectNum,paginationCnt);
		return pageBean;
	}
	
	public int getRoleRealCnt(HashMap<Object,Object> map) {
		int roleCnt = managerAdmiDao.getRoleCnt(map);
		return roleCnt;
	}
	
	public void deleteRole(int roleGroupId) {
		managerAdmiDao.deleteRole(roleGroupId);
	}
	
	public void deleteAllRole(List<Integer> idList) {
		managerAdmiDao.deleteAllRole(idList);
	}
	
	public List<HashMap<Object,Object>> getRoleName(){
		return managerAdmiDao.getRoleName();
	}
	
	public void managerRegister(ManagerAddBean bean, List<Integer> franchiseId) {
		
		//운영자 코드 생성
		String code = new String();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		    	code += (char) ((int) (rnd.nextInt(26)) + 97);
		        break;
		    case 1:
		        // A-Z
		    	code += (char) ((int) (rnd.nextInt(26)) + 65);
		        break;
		    case 2:
		        // 0-9
		    	code += rnd.nextInt(10);
		        break;
		    }
		}
		
		//코드 셋팅
		bean.setFranchiseManagerCode(code);
		
		//운영자 등록 
		managerAdmiDao.managerRegister(bean);
		
		List<HashMap<Object,Object>> list = new ArrayList<HashMap<Object,Object>>();
		
		for(int i=0;i<franchiseId.size();i++) {
			
			HashMap<Object,Object> map = new HashMap<Object,Object>();
			map.put("franchiseManagerId",bean.getFranchiseManagerId());
			map.put("franchiseId",(int)franchiseId.get(i));
			list.add(map);
			
		}
		
		managerAdmiDao.managerFranRegister(list);
		
	}
	
	public HashMap<Object,Object> getManagerInfo(int franchiseManagerId){
		return managerAdmiDao.getManagerInfo(franchiseManagerId);
	}
	
	public void updateManagerInfo(ManagerAddBean bean,List<Integer> franchiseId) {
		
		//정보 수정
		managerAdmiDao.updateManagerInfo(bean);
		
		//접근 가능 가맹사 삭제
		managerAdmiDao.deleteManagerFran(bean.getFranchiseManagerId());
		
		List<HashMap<Object,Object>> list = new ArrayList<HashMap<Object,Object>>();
		
		for(int i=0;i<franchiseId.size();i++) {
			
			HashMap<Object,Object> map = new HashMap<Object,Object>();
			map.put("franchiseManagerId",bean.getFranchiseManagerId());
			map.put("franchiseId",(int)franchiseId.get(i));
			list.add(map);
			
		}
		
		//접근 가능 가맹사 등록 
		managerAdmiDao.managerFranRegister(list);
		
	}
	
	public void deleteManager(int franchiseManagerId) {
		
		//운영자 접근 가능 가맹점 삭제
		managerAdmiDao.deleteManagerFran(franchiseManagerId);
		
		//운영자 삭제
		managerAdmiDao.deleteManager(franchiseManagerId);
		
	}
	
	public List<HashMap<Object,Object>> getAccountList(int page,HashMap<Object,Object> map,int selectNum){
		int start = (page - 1) * selectNum;
		RowBounds rowBounds = new RowBounds(start,selectNum);
		return managerAdmiDao.getAccountList(map,rowBounds);
	}
	
	public PageBean getAccountCnt(int page,HashMap<Object,Object> map,int selectNum) {
		int accountCnt = managerAdmiDao.getAccountCnt(map);
		PageBean pageBean = new PageBean(page,accountCnt,selectNum,paginationCnt);
		return pageBean;
	}
	
	public int getAccountRealCnt(HashMap<Object,Object> map) {
		int accountCnt = managerAdmiDao.getAccountCnt(map);
		return accountCnt;
	}

}
