package com.roomio.carret.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.roomio.carret.bean.FranchiseAddBean;
import com.roomio.carret.bean.FranchiseRegisterBean;
import com.roomio.carret.bean.FranchiseResponBean;
import com.roomio.carret.bean.LoginManagerBean;
import com.roomio.carret.bean.LoginMemberBean;
import com.roomio.carret.bean.ManagerNoticeRegisterBean;
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
	
	@Value("${path.upload}")
	private String pathUpload;

	@Autowired
	private ManagerDao managerDao;
	
	@Resource(name = "loginManagerBean")
	@Lazy
	private LoginManagerBean loginManagerBean;
	
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
	
	public void checkManagerMember(HashMap<String, String> map) {
		
		 HashMap<Object,Object> loginMap = managerDao.checkManagerMember(map);
		 
		 if(loginMap != null) {
			 
			 loginManagerBean.setIslogin(true);
			 
			 loginManagerBean.setFranchise_manager_id((int)loginMap.get("franchise_manager_id"));
			 loginManagerBean.setFranchise_id((int)loginMap.get("franchise_id"));
			 loginManagerBean.setFranchise_manager_code((String)loginMap.get("franchise_manager_code"));
			 loginManagerBean.setStatus((int)loginMap.get("status"));
			 loginManagerBean.setId((String)loginMap.get("id"));
			 loginManagerBean.setPw((String)loginMap.get("pw"));
			 loginManagerBean.setName((String)loginMap.get("name"));
			 
		 }
		 
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
	
	public PageBean getFranchiseCnt(int page,HashMap<Object,Object> map) {
		int franchiseCnt = managerDao.getFranchiseCnt(map);
		PageBean pageBean = new PageBean(page,franchiseCnt,(int)map.get("selectNum"),paginationCnt);
		return pageBean;
	}
	
	public int getFranchiseRealCnt(int page,HashMap<Object,Object> map) {
		int franchiseCnt = managerDao.getFranchiseCnt(map);
		return franchiseCnt;
	}
	
	public List<FranchiseRegisterBean> getFranchiseList(int page,HashMap<Object,Object> map){
		int start = (page - 1) * (int)map.get("selectNum");
		RowBounds rowBounds = new RowBounds(start,(int)map.get("selectNum"));
		return managerDao.getFranchiseList(map,rowBounds);
	}
	
	public void franchiseRegister(FranchiseAddBean franchiseAddBean,String[] responName,
												String[] responPhone,String[] responEmail) {
		
		
		//이미지파일 셋팅 
		MultipartFile uploadFile = franchiseAddBean.getUploadFile();
		
		if(uploadFile.getSize() > 0) {
			
			String fileName = saveUploadFile(uploadFile);
			franchiseAddBean.setLogoFile(fileName);
			
		}
		
		//데이터 수정 
		
		if(franchiseAddBean.getShopService() != null && franchiseAddBean.getShopService().equals("on")) {
			franchiseAddBean.setShopServiceInt(1);
		}else {
			franchiseAddBean.setShopServiceInt(2);
		}
		
		if(franchiseAddBean.getDailyService() != null && franchiseAddBean.getDailyService().equals("on")) {
			franchiseAddBean.setDailyServiceInt(1);
		}else {
			franchiseAddBean.setDailyServiceInt(2);
		}
		
		if(franchiseAddBean.getUsedService() != null && franchiseAddBean.getUsedService().equals("on")) {
			franchiseAddBean.setUsedServiceInt(1);
		}else {
			franchiseAddBean.setUsedServiceInt(2);
		}
		
		if(franchiseAddBean.getDirectTradeService() != null && franchiseAddBean.getDirectTradeService().equals("on")) {
			franchiseAddBean.setDirectTradeServiceInt(1);
		}else {
			franchiseAddBean.setDirectTradeServiceInt(2);
		}
		
		//가맹점 코드 생성
		
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
		
		//가맹점 코드 set
		franchiseAddBean.setFranchiseCode(FranchiseCode);
		
		//가맹점 등록
		managerDao.franchiseRegister(franchiseAddBean);
		
		List<FranchiseResponBean> responList = new ArrayList<FranchiseResponBean>();
		
		for(int i=0;i<responName.length;i++) {
			
			FranchiseResponBean franchiseResponBean = new FranchiseResponBean();
			
			//가맹점 번호 set
			franchiseResponBean.setFranchiseId(franchiseAddBean.getFranchiseId());
			
			//담당자 정보 set
			franchiseResponBean.setResponName(responName[i]);
			franchiseResponBean.setResponEmail(responEmail[i]);
			franchiseResponBean.setResponPhone(responPhone[i]);
			
			responList.add(franchiseResponBean);
			
		}
		
		managerDao.franchiseResponRegister(responList);
		
	}
	
	public HashMap<Object,Object> getFranchiseInfo(int franchiseId){
		return managerDao.getFranchiseInfo(franchiseId);
	}
	
	public List<HashMap<Object,Object>> getFranchiseResponInfo(int franchiseId){
		return managerDao.getFranchiseResponInfo(franchiseId);
	}
	
	public void franchiseUpdate(FranchiseAddBean franchiseAddBean,String[] responName,
			String[] responPhone,String[] responEmail) {
		
		//파일 업로드 객체 생성 및 bean에 파일 이름 저장 
		
		if(!franchiseAddBean.getUploadFile().isEmpty()) {
			
			String logoFile = managerDao.getNowLogoFile(franchiseAddBean.getFranchiseId());
			
			File file = new File(pathUpload+logoFile);
			
			//파일이 존재하면 삭제 
			
			if(file.exists()) {
				
				file.delete();
				
			}
			
			//이미지파일 셋팅 
			MultipartFile uploadFile = franchiseAddBean.getUploadFile();
			
			if(uploadFile.getSize() > 0) {
			
				String fileName = saveUploadFile(uploadFile);
				franchiseAddBean.setLogoFile(fileName);
				
			}
			
		}


		
		
		//데이터 수정 
		
		if(franchiseAddBean.getShopService() != null && franchiseAddBean.getShopService().equals("on")) {
			franchiseAddBean.setShopServiceInt(1);
		}else {
			franchiseAddBean.setShopServiceInt(2);
		}
		
		if(franchiseAddBean.getDailyService() != null && franchiseAddBean.getDailyService().equals("on")) {
			franchiseAddBean.setDailyServiceInt(1);
		}else {
			franchiseAddBean.setDailyServiceInt(2);
		}
		
		if(franchiseAddBean.getUsedService() != null && franchiseAddBean.getUsedService().equals("on")) {
			franchiseAddBean.setUsedServiceInt(1);
		}else {
			franchiseAddBean.setUsedServiceInt(2);
		}
		
		if(franchiseAddBean.getDirectTradeService() != null && franchiseAddBean.getDirectTradeService().equals("on")) {
			franchiseAddBean.setDirectTradeServiceInt(1);
		}else {
			franchiseAddBean.setDirectTradeServiceInt(2);
		}
		
		
		//가맹점 등록
		managerDao.franchiseUpdate(franchiseAddBean);
		
		//가맹점 담당자 삭제
		managerDao.franchiseResponDelete(franchiseAddBean.getFranchiseId());
		
		List<FranchiseResponBean> responList = new ArrayList<FranchiseResponBean>();
		
		for(int i=0;i<responName.length;i++) {
		
			FranchiseResponBean franchiseResponBean = new FranchiseResponBean();
			
			//가맹점 번호 set
			franchiseResponBean.setFranchiseId(franchiseAddBean.getFranchiseId());
			
			//담당자 정보 set
			franchiseResponBean.setResponName(responName[i]);
			franchiseResponBean.setResponEmail(responEmail[i]);
			franchiseResponBean.setResponPhone(responPhone[i]);
			
			responList.add(franchiseResponBean);
		
		}
		
		managerDao.franchiseResponRegister(responList);
		
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
	
	//공지사항 등록 
	public void addManagerNotice(ManagerNoticeRegisterBean managerNoticeRegisterBean,
								List<Integer> franchiseId) {
		
		if(!managerNoticeRegisterBean.getUploadFile().isEmpty()) {
		
			MultipartFile uploadFile = managerNoticeRegisterBean.getUploadFile();
		
			if(uploadFile.getSize() > 0) {
				
				
				String fileName = saveUploadFile(uploadFile);
				String oriFileName = uploadFile.getOriginalFilename();
				
				managerNoticeRegisterBean.setOriAttachFile(oriFileName);
				managerNoticeRegisterBean.setAttachFile(fileName);
				
			}
			
		}
		
		//공지사항 등록 
		managerDao.addManagerNotice(managerNoticeRegisterBean);
		
		List<HashMap<Object,Object>> list = new ArrayList<HashMap<Object,Object>>();
		
		for(int i=0;i<franchiseId.size();i++) {
			
			HashMap<Object,Object> map = new HashMap<Object,Object>();
			map.put("managerNoticeId",managerNoticeRegisterBean.getManagerNoticeId());
			map.put("franchiseId",franchiseId.get(i));
			list.add(map);
			
		}
		
		//공지사항 가맹사 등록
		managerDao.addManagerNoticeFran(list);
		
	}
	
	public PageBean getManagerNoticeCnt(int page,HashMap<Object,Object> map) {
		int franchiseCnt = managerDao.getManagerNoticeCnt(map);
		PageBean pageBean = new PageBean(page,franchiseCnt,(int)map.get("selectNum"),paginationCnt);
		return pageBean;
	}
	
	public int getManagerNoticeRealCnt(int page,HashMap<Object,Object> map) {
		int noticeCnt = managerDao.getManagerNoticeCnt(map);
		return noticeCnt;
	}
	
	public List<HashMap<Object,Object>> getManagerNotice(int page,HashMap<Object,Object> map){
		int start = (page - 1) * (int)map.get("selectNum");
		RowBounds rowBounds = new RowBounds(start,(int)map.get("selectNum"));
		return managerDao.getManagerNotice(map,rowBounds);
	}
	
	public void deleteManagerNotice(int managerNoticeId) {
		
		//공지사항 가맹점 삭제
		managerDao.deleteManagerNoticeFran(managerNoticeId);
		
		//공지사항 삭제
		managerDao.deleteManagerNotice(managerNoticeId);

	}
	
	public List<Integer> getManagerNoticeFran(int managerNoticeId){
		return managerDao.getManagerNoticeFran(managerNoticeId);
	}
	
	public void updateManagerNotice(ManagerNoticeRegisterBean managerNoticeRegisterBean,
									List<Integer> franchiseId) {
		
		if(!managerNoticeRegisterBean.getUploadFile().isEmpty()) {
			
			MultipartFile uploadFile = managerNoticeRegisterBean.getUploadFile();
		
			if(uploadFile.getSize() > 0) {
				
				
				String fileName = saveUploadFile(uploadFile);
				String oriFileName = uploadFile.getOriginalFilename();
				
				managerNoticeRegisterBean.setOriAttachFile(oriFileName);
				managerNoticeRegisterBean.setAttachFile(fileName);
				
			}
			
		}
		
		//공지사항 등록 
		managerDao.updateManagerNotice(managerNoticeRegisterBean);
		
		List<HashMap<Object,Object>> list = new ArrayList<HashMap<Object,Object>>();
		
		for(int i=0;i<franchiseId.size();i++) {
			
			HashMap<Object,Object> map = new HashMap<Object,Object>();
			map.put("managerNoticeId",managerNoticeRegisterBean.getManagerNoticeId());
			map.put("franchiseId",franchiseId.get(i));
			list.add(map);
			
		}
		
		managerDao.deleteManagerNoticeFran(managerNoticeRegisterBean.getManagerNoticeId());
		
		//공지사항 가맹사 등록
		managerDao.addManagerNoticeFran(list);
		
		
	}
	
	public PageBean getManagerActivityCnt(int page,HashMap<Object,Object> map) {
		int activityCnt = managerDao.getMangerActivityCnt(map);
		PageBean pageBean = new PageBean(page,activityCnt,(int)map.get("selectNum"),paginationCnt);
		return pageBean;
	}
	
	public int getManagerActivityRealCnt(int page,HashMap<Object,Object> map) {
		int activityCnt = managerDao.getMangerActivityCnt(map);
		return activityCnt;
	}
	
	public List<HashMap<Object,Object>> getManagerActivity(int page,HashMap<Object,Object> map){
		int start = (page - 1) * (int)map.get("selectNum");
		RowBounds rowBounds = new RowBounds(start,(int)map.get("selectNum"));
		return managerDao.getMangerActivity(map,rowBounds);
	}
	
	public PageBean getManagerAccessCnt(int page,HashMap<Object,Object> map) {
		int accessCnt = managerDao.getManagerAccessCnt(map);
		PageBean pageBean = new PageBean(page,accessCnt,(int)map.get("selectNum"),paginationCnt);
		return pageBean;
	}
	
	public int getManagerAccessRealCnt(int page,HashMap<Object,Object> map) {
		int accessCnt = managerDao.getManagerAccessCnt(map);
		return accessCnt;
	}
	
	public List<HashMap<Object,Object>> getManagerAccess(int page,HashMap<Object,Object> map){
		int start = (page - 1) * (int)map.get("selectNum");
		RowBounds rowBounds = new RowBounds(start,(int)map.get("selectNum"));
		return managerDao.getManagerAccess(map,rowBounds);
	}
	
	
	
}
