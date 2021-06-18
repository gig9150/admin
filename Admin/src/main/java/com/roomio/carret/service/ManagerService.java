package com.roomio.carret.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.roomio.carret.bean.FranchiseRegisterBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.RoleGroupsBean;
import com.roomio.carret.bean.SearchBean;
import com.roomio.carret.dao.ManagerDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ManagerService {
	
	@Value("${page.listCut}")
	private int listCnt;
	
	@Value("${page.paginationCnt}")
	private int paginationCnt;

	@Autowired
	private ManagerDao managerDao;
	
	public String checkManagerMember(HashMap<String, String> map) {
		return managerDao.checkManagerMember(map);
	}
	
	public List<HashMap<String,String>> getRoleDetailList(){
		return managerDao.getRoleDetailList();
	}
	
	public void addRoleGroups(HashMap<Object,Object> map) {
		managerDao.addRoleGroups(map);
	}
	
	public void addRoleGroupsDetail(HashMap<Object,Object> detailMap) {
		managerDao.addRoleGroupsDetail(detailMap);
	}
	
	public List<HashMap<String,String>> getRoleGroupsList(int page,SearchBean searchBean){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return managerDao.getRoleGroupsList(searchBean,rowBounds);
	}
	
	public PageBean getRoleGroupsCnt(int page,SearchBean searchBean) {
		int roleGroupsCnt = managerDao.getRoleGroupsCnt(searchBean);
		PageBean pageBean = new PageBean(page,roleGroupsCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public void deleteRoleGroups(int roleGroupId) {
		managerDao.deleteRoleGroups(roleGroupId);
	}
	
	public void deleteRoleGroupsDetail(int roleGroupId) {
		managerDao.deleteRoleGroupsDetail(roleGroupId);
	}
	
	public PageBean getFranchiseCnt(int page,String keyWord) {
		int franchiseCnt = managerDao.getFranchiseCnt(keyWord);
		PageBean pageBean = new PageBean(page,franchiseCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public List<FranchiseRegisterBean> getFranchiseList(int page,String keyword){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return managerDao.getFranchiseList(keyword,rowBounds);
	}
	
	//업로드된 파일 이름 얻는 메소드 
	private String saveUploadFile(MultipartFile upload_file) {
		
		String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();
		
		try {
			upload_file.transferTo(new File("C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RoomioAdmin\\resources\\upload" + "/" + file_name));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	
	public void addFranchise(FranchiseRegisterBean registerBean,
							HashMap<Object,Object> managerMap,
							String[] additionalDomain) {
		
		//파일 업로드 객체 생성 및 bean에 파일 이름 저장 
		
		MultipartFile uploadFile = registerBean.getUploadFile();
		
		if(uploadFile.getSize() > 0) {
			
			String fileName = saveUploadFile(uploadFile);
			registerBean.setLogoFile(fileName);
			
		}
		
		// 랜덤 코드 생성 
		
		String FranchiseCode = new String();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		    	FranchiseCode += (char) ((int) (rnd.nextInt(26)) + 97);
		        break;
		    case 1:
		        // A-Z
		    	FranchiseCode += (char) ((int) (rnd.nextInt(26)) + 65);
		        break;
		    case 2:
		        // 0-9
		    	FranchiseCode += rnd.nextInt(10);
		        break;
		    }
		}
		
		registerBean.setFranchiseCode(FranchiseCode);
		registerBean.setServiceStatus("영업");
		
		
		
		//프렌차이즈 등록
		managerDao.addFranchise(registerBean);
		
		//매니저 등록
		managerMap.put("franchiseId", registerBean.getFranchiseId());
		managerDao.addFranchiseManager(managerMap);
		
		//도메인 등록 
		HashMap<Object,Object> domainMap = new HashMap<Object,Object>();
		domainMap.put("franchiseId", registerBean.getFranchiseId());
		if(additionalDomain != null) {
			for(String domain : additionalDomain) {
				domainMap.put("additionalDomain",domain);
				managerDao.addFranchiseDomain(domainMap);
			}
		}
	}
	
	public void updateFranchise(FranchiseRegisterBean registerBean,
			HashMap<Object,Object> managerMap,
			String[] additionalDomain) {

		//파일 업로드 객체 생성 및 bean에 파일 이름 저장 
		
		if(!registerBean.getUploadFile().isEmpty()) {
			
			String logoFile = managerDao.getNowLogoFile(registerBean.getFranchiseId());
			
			File file = new File("C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RoomioAdmin\\resources\\upload\\"+logoFile);
			
			//파일이 존재하면 삭제 
			
			if(file.exists()) {
				
				file.delete();
				
			}
			
			MultipartFile uploadFile = registerBean.getUploadFile();
			
			if(uploadFile.getSize() > 0) {
				
				String fileName = saveUploadFile(uploadFile);
				
				registerBean.setLogoFile(fileName);
				
			}
			
		}
		
		//프렌차이즈 수정
		managerDao.updateFranchise(registerBean);
	
		
		//매니저 수정
		managerMap.put("franchiseId", registerBean.getFranchiseId());
		managerDao.updateFranchiseManager(managerMap);
		
		//도메인 수정(삭제 후 재입력 )
		
		managerDao.deleteFranchiseDomain(registerBean.getFranchiseId());
		
		HashMap<Object,Object> domainMap = new HashMap<Object,Object>();
		domainMap.put("franchiseId", registerBean.getFranchiseId());
		
		for(String domain : additionalDomain) {
			domainMap.put("additionalDomain",domain);
			managerDao.addFranchiseDomain(domainMap);
		}
		
	}
	
	public HashMap<Object,Object> updateGetRoleGroup(int roleGroupId) {
		return managerDao.updateGetRoleGroup(roleGroupId);
	}
	
	public List<String> getRoleGroupDetail(int roleGroupId) {
		return managerDao.getRoleGroupDetail(roleGroupId);
	}
	
	//역할 그룹 업데이트
	public void updateRoleGroups(RoleGroupsBean groupsBean,int roleGroupId,String register) {
		
		//역할 그룹 업데이트
		HashMap<Object,Object> groupsMap = new HashMap<Object,Object>();
		groupsMap.put("roleGroupId", roleGroupId);
		groupsMap.put("roleGroupName", groupsBean.getRoleGroupName());
		groupsMap.put("roleGroupInfo", groupsBean.getRoleGroupInfo());
		groupsMap.put("franchiseCode", groupsBean.getFranchiseManagerCode());
		groupsMap.put("register", register);
		
		managerDao.updateRoleGroups(groupsMap);
		
		//역할 그룹 디테일 삭제
		managerDao.deleteRoleGroupsDetail(roleGroupId);
		
		//역할 그룹 디테일 재생성 
		
		String[] roleDetail = groupsBean.getRoleDetail();
		
		HashMap<Object,Object> detailMap = new HashMap<Object,Object>();
		
		detailMap.put("roleGroupId",roleGroupId);
		
		if(roleDetail != null) {
			for(String str : roleDetail) {
				int roleDetailId = Integer.parseInt(str);
				detailMap.put("roleDetailId",roleDetailId);
				managerDao.addRoleGroupsDetail(detailMap);
			}
		}
	}
	
}
