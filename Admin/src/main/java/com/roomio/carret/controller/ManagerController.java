package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roomio.carret.bean.FranchiseAddBean;
import com.roomio.carret.bean.FranchiseRegisterBean;
import com.roomio.carret.bean.FranchiseResponBean;
import com.roomio.carret.bean.LoginManagerBean;
import com.roomio.carret.bean.ManagerNoticeRegisterBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.RoleGroupsBean;
import com.roomio.carret.bean.SearchBean;
import com.roomio.carret.service.ManagerService;
import com.roomio.carret.service.ShopService;

@Controller
public class ManagerController {

	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private ShopService shopService;
	
	@Resource(name = "loginManagerBean")
	@Lazy
	private LoginManagerBean loginManagerBean;
	
	@GetMapping("/manager/login")
	public String managerLogin() {
		return "manager_login";
	}
	
	@PostMapping("/manager/loginPro")
	public String managerLoginPro(String id,String pw,HttpSession session,
								Model model) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		managerService.checkManagerMember(map);

		if(loginManagerBean.isIslogin() == true) {
			session.setAttribute("id", id);
			return "redirect:/";
		}else {
			return "redirect:/manager/login";
		}
		
	}
	
	@GetMapping("/manager/logout")
	public String managerLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//매니저 역할그룹 
	@GetMapping("/manager/manage_role")
	public String manageRole(Model model,
			@RequestParam(value="page",defaultValue = "1")int page,
			@RequestParam(value="searchOption", defaultValue = "all")String searchOption,
			@RequestParam(value="keyWord", defaultValue = "")String keyWord) {
		
	
		SearchBean searchBean = new SearchBean(searchOption,keyWord);
		
		//역할 그룹 리스트
		List<HashMap<String,String>> roleGroupsList = managerService.getRoleGroupsList(page,searchBean);
		model.addAttribute("roleGroupsList",roleGroupsList);
		
		//페이징 처리 
		PageBean pageBean = managerService.getRoleGroupsCnt(page,searchBean);
		model.addAttribute("pageBean",pageBean);
		
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyWord",keyWord);
		
		return "manager/manage_role";
	}
	
	//매니저 역할그룹 등록
	
	@GetMapping("/manager/manage_role_register")
	public String manageRoleRegister(Model model) {
		List<HashMap<String,String>> roleDetailList = managerService.getRoleDetailList();
		model.addAttribute("roleDetailList",roleDetailList);
		return "manager/manage_role_register";
	}
	
	
	@PostMapping("/manager/manage_role_register_pro")
	public String manageRoleRegisterPro(@ModelAttribute RoleGroupsBean roleGroupsBean
										,HttpSession session) {
		
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("roleGroupId", 0);
		map.put("roleGroupName",roleGroupsBean.getRoleGroupName());
		map.put("roleGroupInfo",roleGroupsBean.getRoleGroupInfo());
		map.put("franchiseCode",roleGroupsBean.getFranchiseManagerCode());
		map.put("registrar",(String)session.getAttribute("id"));
		
		managerService.addRoleGroups(map);
		
		//디테일 정보 입력해야될 키값 
		int roleGroupId = (int)map.get("roleGroupId");
		String[] roleDetail = roleGroupsBean.getRoleDetail();
		
		HashMap<Object,Object> detailMap = new HashMap<Object,Object>();
		detailMap.put("roleGroupId",roleGroupId);
		
		if(roleDetail != null) {
			for(String str : roleDetail) {
				int roleDetailId = Integer.parseInt(str);
				detailMap.put("roleDetailId",roleDetailId);
				managerService.addRoleGroupsDetail(detailMap);
			}
		}
		
		return "redirect:/";
	}
	
	//역할 그룹 수정
	@GetMapping("/manager/manage_role_update")
	public String manageRoleUpdate(@RequestParam int roleGroupId,
								Model model) {
		
		//역할 그룹 정보
		HashMap<Object,Object> groupsMap = managerService.updateGetRoleGroup(roleGroupId);
		model.addAttribute("groupsMap",groupsMap);
		
		//역할 그룹 디테일 정보
		List<String> roleGroupDetail = managerService.getRoleGroupDetail(roleGroupId);
		model.addAttribute("roleGroupDetail",roleGroupDetail);
		
		List<HashMap<String,String>> roleDetailList = managerService.getRoleDetailList();
		model.addAttribute("roleDetailList",roleDetailList);
		
		model.addAttribute("roleGroupId",roleGroupId);
		
		return "manager/manage_role_update";
	}
	
	@PostMapping("/manager/manage_role_update_pro")
	public String manageRoleUpdatePro(@ModelAttribute RoleGroupsBean groupsBean,
									@RequestParam int roleGroupId,
									HttpSession session) {
		
		managerService.updateRoleGroups(groupsBean,roleGroupId,(String)session.getAttribute("id"));
		
		return "redirect:/";
	}
	
	//역할 그룹 삭제 
	
	@GetMapping("/manager/manage_role/delete")
	public String manageRoleDelete(@RequestParam int roleGroupId,
			@RequestParam(value="page",defaultValue = "1")int page,
			@RequestParam(value="searchOption", defaultValue = "all") String searchOption,
			@RequestParam(value="keyWord", defaultValue = "") String keyWord,
			Model model) {
		
		managerService.deleteRoleGroupsDetail(roleGroupId);
		managerService.deleteRoleGroups(roleGroupId);
		
		model.addAttribute("page",page);
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyWord",keyWord);
		
		return "manager/manage_role_delete";
	}
	
	//가맹사 관리
	
	@GetMapping("/manager/manage_franchise")
	public String manageFranchise(@RequestParam(value="page",defaultValue = "1")int page,
			@RequestParam(required = false) String keyWord,
			@RequestParam(required = false) String startDate,
			@RequestParam(required = false) String endDate,
			@RequestParam(required = false) String select,
			@RequestParam(defaultValue = "10")int selectNum,
			Model model) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("select",select);
		map.put("keyWord",keyWord);
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		map.put("selectNum",selectNum);
		
		
		//가맹사 리스트
		List<FranchiseRegisterBean> franchiseList = managerService.getFranchiseList(page,map);
		model.addAttribute("franchiseList",franchiseList);
		
		//페이징 처리 
		PageBean pageBean = managerService.getFranchiseCnt(page,map);
		model.addAttribute("pageBean",pageBean);
		
		int franchiseCnt = managerService.getFranchiseRealCnt(page, map);
		model.addAttribute("franchiseCnt",franchiseCnt);
		
		model.addAttribute("map",map);
		model.addAttribute("page",page);
		
		return "manager/manage_franchise";
	}
	
	//가맹사 등록
	@GetMapping("/manager/franchise_register")
	public String franchiseRegister() {
		
		return "manager/franchise_register";
		
	}
	
	@PostMapping("/manager/manage_franchise_register_pro")
	public String manageFranchiseRegisterPro(@ModelAttribute FranchiseAddBean franchiseAddBean,
											@RequestParam(required = false)String[] responName,
											@RequestParam(required = false)String[] responPhone,
											@RequestParam(required = false)String[] responEmail) {
		
		
		managerService.franchiseRegister(franchiseAddBean,responName,responPhone,responEmail);
		
		return "manager/franchise_register_success";
	}
	
	//가맹사 수정
	@GetMapping("/manager/franchise_update")
	public String franchiseUpdate(@RequestParam int franchiseId,
								Model model) {
		
		//가맹점 정보
		HashMap<Object,Object> franchiseMap = managerService.getFranchiseInfo(franchiseId);
		model.addAttribute("franchiseMap",franchiseMap);
		
		//가맹점 담당자 정보
		List<HashMap<Object,Object>> responList = managerService.getFranchiseResponInfo(franchiseId);
		model.addAttribute("responList",responList);
		
		return "manager/franchise_update";
	}
	
	@PostMapping("/manager/manage_franchise_update_pro")
	public String manageFranchiseUpdatePro(@ModelAttribute FranchiseAddBean franchiseAddBean,
										@RequestParam(required = false)String[] responName,
										@RequestParam(required = false)String[] responPhone,
										@RequestParam(required = false)String[] responEmail) {
		
		managerService.franchiseUpdate(franchiseAddBean,responName,responPhone,responEmail);
		
		return "manager/franchise_update_success";
		
	}
	
	//관리자 공지관리
	@GetMapping("/manager/manage_notice")
	public String manageNotice(@RequestParam(value="page",defaultValue = "1")int page,
								@RequestParam(required = false) String keyWord,
								@RequestParam(required = false) String startDate,
								@RequestParam(required = false) String endDate,
								@RequestParam(required = false) String select,
								@RequestParam(defaultValue = "10")int selectNum,
								@RequestParam(defaultValue = "0") int franchiseId,
								Model model) {
		
		//가맹점 이름 얻어오기
		List<HashMap<Object,Object>> franchiseList = shopService.getFranchiseName();
		model.addAttribute("franchiseList",franchiseList);
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("select",select);
		map.put("keyWord",keyWord);
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		map.put("selectNum",selectNum);
		map.put("franchiseId",franchiseId);
		
		//공지사항 리스트 얻어오기
		List<HashMap<Object,Object>> noticeList = managerService.getManagerNotice(page, map);
		model.addAttribute("noticeList",noticeList);
		
		//공지사항 페이지 빈 
		PageBean pageBean = managerService.getManagerNoticeCnt(page, map);
		model.addAttribute("pageBean",pageBean);
		
		//공지사항 글 갯수 
		int noticeCnt = managerService.getManagerNoticeRealCnt(page, map);
		model.addAttribute("noticeCnt",noticeCnt);
		
		model.addAttribute("map",map);
		model.addAttribute("page",page);
		
		return "manager/manage_notice";
	}
	
	//관리자 공지 등록
	@PostMapping("/manager/notice_register_pro")
	public String noticeRegisterPro(@ModelAttribute ManagerNoticeRegisterBean managerNoticeRegisterBean,
									@RequestParam List<Integer> franchiseId) {
		
		
		//나중에 매니저 번호 셋팅해주기 ★★
		managerNoticeRegisterBean.setFranchiseManagerId(1);
	
		managerService.addManagerNotice(managerNoticeRegisterBean,franchiseId);
		
		return "manager/notice_register_pro";
	}
	
	//관리자 공지 삭제
	@RequestMapping("/manager/manager_notice_delete")
	public String managerNoticeDelete(@RequestParam int managerNoticeId) {
		
		managerService.deleteManagerNotice(managerNoticeId);
		
		return "redirect:/manager/manage_notice";
		
	}
	
	//관리자 공지 수정
	@RequestMapping("/manager/manager_notice_update")
	public String managerNoticeUpdate(@ModelAttribute ManagerNoticeRegisterBean managerNoticeRegisterBean,
									@RequestParam List<Integer> franchiseId) {
		
		managerService.updateManagerNotice(managerNoticeRegisterBean,franchiseId);
		
		return "manager/manager_notice_update_success";
	}
	
	//운영자 활동 내역
	@RequestMapping("/manager/manager_activity")
	public String managerActivity(@RequestParam(value="page",defaultValue = "1")int page,
								@RequestParam(required = false) String keyWord,
								@RequestParam(required = false) String startDate,
								@RequestParam(required = false) String endDate,
								@RequestParam(required = false) String select,
								@RequestParam(defaultValue = "10")int selectNum,
								Model model) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("select",select);
		map.put("keyWord",keyWord);
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		map.put("selectNum",selectNum);
		
		List<HashMap<Object,Object>> activityList = managerService.getManagerActivity(page, map);
		model.addAttribute("activityList",activityList);
		
		PageBean pageBean  = managerService.getManagerActivityCnt(page, map);
		model.addAttribute("pageBean",pageBean);
		
		int activityCnt = managerService.getManagerActivityRealCnt(page, map);
		model.addAttribute("activityCnt",activityCnt);
		
		model.addAttribute("map",map);
		model.addAttribute("page",page);
		
		return "manager/manager_activity";
	}
	
	//운영자 접속 내역 
	@RequestMapping("/manager/manager_access")
	public String managerAccess(@RequestParam(value="page",defaultValue = "1")int page,
								@RequestParam(required = false) String keyWord,
								@RequestParam(required = false) String startDate,
								@RequestParam(required = false) String endDate,
								@RequestParam(required = false) String select,
								@RequestParam(required = false) String proSelect,
								@RequestParam(defaultValue = "10")int selectNum,
								Model model) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("select",select);
		map.put("proSelect",proSelect);
		map.put("keyWord",keyWord);
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		map.put("selectNum",selectNum);
		
		List<HashMap<Object,Object>> accessList = managerService.getManagerAccess(page, map);
		model.addAttribute("accessList",accessList);
		
		PageBean pageBean = managerService.getManagerAccessCnt(page, map);
		model.addAttribute("pageBean",pageBean);
		
		int accessCnt = managerService.getManagerAccessRealCnt(page, map);
		model.addAttribute("accessCnt",accessCnt);
		
		model.addAttribute("map",map);
		model.addAttribute("page",page);
		
		return "manager/manager_access";
	}
	
	

	
}
