package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roomio.carret.bean.ManagerRegisterBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.service.ManagerAccountService;
import com.roomio.carret.service.ManagerService;

@Controller
@RequestMapping("/manager")
public class ManagerAccountController {

	@Autowired
	private ManagerAccountService managerAccountService;
	
	//매니저 계정 관리
	@GetMapping("/manage_account")
	public String manageAccount(Model model,
			@RequestParam(value="page",defaultValue = "1")int page,
			@RequestParam(value="searchOption", defaultValue = "all")String searchOption,
			@RequestParam(value="keyWord", defaultValue = "")String keyWord) {
		
		HashMap<Object,Object> searchMap = new HashMap<Object,Object>();
		searchMap.put("searchOption",searchOption);
		searchMap.put("keyWord", keyWord);
		
		//관리자 리스트
		List<HashMap<Object,Object>> managerList = managerAccountService.getManagerList(page,searchMap);
		model.addAttribute("managerList",managerList);
		
		//페이징 처리 
		PageBean pageBean = managerAccountService.getManagerCnt(page,searchMap);
		model.addAttribute("pageBean",pageBean);
		
		//검색 조건, 검색어 담기
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyWord",keyWord);
		
		return "manager/manage_account";
	}
		
	//매니저 계정 등록
	@GetMapping("/manage_account_register")
	public String manageAccountRegister(Model model) {
		
		//가맹점 이름,코드
		List<HashMap<String,String>> franchiseList = managerAccountService.getFranchiseList();
		model.addAttribute("franchiseList",franchiseList);
		//역할 그룹 
		List<HashMap<String,String>> roleGroupsList = managerAccountService.getRoleGroupsList();
		model.addAttribute("roleGroupsList",roleGroupsList);
		//추가 권한 정보 
		List<HashMap<String,String>> getAdditionalRole = managerAccountService.getAdditionalRole();
		model.addAttribute("getAdditionalRole",getAdditionalRole);
		
		return "manager/manage_account_register";
	}
	
	//매니저 계정 등록 진행 
	@PostMapping("/manage_account_register_pro")
	public String manageAccountRegisterPro(@ModelAttribute ManagerRegisterBean managerRegisterBean,
											@RequestParam(required = false) String[] roleDetail) {
		
		//계정등록
		managerRegisterBean.setStatus(2);
		managerAccountService.managerRegister(managerRegisterBean);
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		
		if(roleDetail != null) {
			//계정에 추가 권한 부여 
			for(String additionalRoleId : roleDetail) {
				map.put("managerId", managerRegisterBean.getFranchiseId());
				map.put("additionalRoleId",additionalRoleId);
				managerAccountService.addAdditionalRole(map);
			}
		}
		
		return "redirect:/";
	}
	
	//매니저 계정 수정 
	@GetMapping("/manage_account_update")
	public String manageAccountUpdate(Model model,
									@RequestParam int franchiseManagerId) {
		
		//가맹점 이름,코드
		List<HashMap<String,String>> franchiseList = managerAccountService.getFranchiseList();
		model.addAttribute("franchiseList",franchiseList);
		//역할 그룹 
		List<HashMap<String,String>> roleGroupsList = managerAccountService.getRoleGroupsList();
		model.addAttribute("roleGroupsList",roleGroupsList);
		//추가 권한 정보 
		List<HashMap<String,String>> getAdditionalRole = managerAccountService.getAdditionalRole();
		model.addAttribute("getAdditionalRole",getAdditionalRole);
		
		//계정 정보 
		HashMap<Object,Object> managerInfoMap = managerAccountService.getUpdateManagerInfo(franchiseManagerId);
		model.addAttribute("managerInfoMap",managerInfoMap);

		return "manager/manage_account_update";
	}
	
	
	//매니저 계정 수정 진행 
	@PostMapping("/manage_account_update_pro")
	public String manageAccountUpdatePro(Model model,
										@ModelAttribute ManagerRegisterBean managerRegisterBean,
										@RequestParam(required = false) String[] roleDetail) {
		
		// 계정 정보 수정,추가권한 삭제 및 부여  
		managerAccountService.updateManagerInfo(managerRegisterBean, roleDetail);
		
		return "redirect:/";
	}
	
	
	//매니저 계정 삭제
	@GetMapping("/manage_account_delete")
	public String manageAccountDelete(@RequestParam int franchiseManagerId,
			@RequestParam(value="page",defaultValue = "1")int page,
			@RequestParam(value="searchOption", defaultValue = "all") String searchOption,
			@RequestParam(value="keyWord", defaultValue = "") String keyWord,
			Model model) {
		
		managerAccountService.deleteManager(franchiseManagerId);
		
		model.addAttribute("page",page);
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyWord",keyWord);
		
		return "manager/manage_account_delete";
		
	}
	
	// 매니저 접속 내역 
	@GetMapping("/manage_access")
	public String manageAccess(@RequestParam(value="page",defaultValue = "1")int page,
			@RequestParam(value="keyWord", defaultValue = "") String keyWord,
			@RequestParam(value="startDate", defaultValue = "2000-01-01") String startDate,
			@RequestParam(value="endDate", defaultValue = "2030-01-01") String endDate,
			Model model) {
		
		HashMap<Object,Object> searchMap = new HashMap<Object,Object>();
		searchMap.put("startDate",startDate);
		searchMap.put("endDate",endDate);
		searchMap.put("keyWord", keyWord);
		
		//관리자 리스트
		List<HashMap<Object,Object>> accessList = managerAccountService.getManagerAccessList(page,searchMap);
		model.addAttribute("accessList",accessList);
		
		//페이징 처리 
		PageBean pageBean = managerAccountService.getManagerAccessCnt(page,searchMap);
		model.addAttribute("pageBean",pageBean);
		
		//검색 조건, 검색어 담기
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		model.addAttribute("keyWord",keyWord);
		
		return "manager/manage_access";
	}
	
	// 가맹사 관리
	
	
	
}
