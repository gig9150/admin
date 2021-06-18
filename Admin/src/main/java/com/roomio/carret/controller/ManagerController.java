package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roomio.carret.bean.FranchiseRegisterBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.RoleGroupsBean;
import com.roomio.carret.bean.SearchBean;
import com.roomio.carret.service.ManagerService;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	@Autowired
	private ManagerService managerService;
	
	@GetMapping("/login")
	public String managerLogin() {
		return "manager_login";
	}
	
	@PostMapping("/loginPro")
	public String managerLoginPro(String id,String pw,HttpSession session) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		String check = managerService.checkManagerMember(map);
		
		if(check != null) {
			session.setAttribute("id", id);
			
			return "redirect:/";
		}else {
			return "redirect:/manager/login";
		}
		
	}
	
	@GetMapping("/logout")
	public String managerLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//매니저 역할그룹 
	@GetMapping("/manage_role")
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
	
	@GetMapping("/manage_role_register")
	public String manageRoleRegister(Model model) {
		List<HashMap<String,String>> roleDetailList = managerService.getRoleDetailList();
		model.addAttribute("roleDetailList",roleDetailList);
		return "manager/manage_role_register";
	}
	
	
	@PostMapping("/manage_role_register_pro")
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
	@GetMapping("/manage_role_update")
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
	
	@PostMapping("/manage_role_update_pro")
	public String manageRoleUpdatePro(@ModelAttribute RoleGroupsBean groupsBean,
									@RequestParam int roleGroupId,
									HttpSession session) {
		
		managerService.updateRoleGroups(groupsBean,roleGroupId,(String)session.getAttribute("id"));
		
		return "redirect:/";
	}
	
	//역할 그룹 삭제 
	
	@GetMapping("/manage_role/delete")
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
	
	@GetMapping("/manage_franchise")
	public String manageFranchise(@RequestParam(value="page",defaultValue = "1")int page,
			@RequestParam(value="keyWord", defaultValue = "") String keyWord,
			Model model) {
		
		//가맹사 리스트
		List<FranchiseRegisterBean> franchiseList = managerService.getFranchiseList(page,keyWord);
		model.addAttribute("franchiseList",franchiseList);
		
		//페이징 처리 
		PageBean pageBean = managerService.getFranchiseCnt(page,keyWord);
		model.addAttribute("pageBean",pageBean);
		
		model.addAttribute("keyWord",keyWord);
		
		return "manager/manage_franchise";
	}
	
	@PostMapping("/manage_franchise_register_pro")
	public String manageFranchiseRegisterPro(@ModelAttribute FranchiseRegisterBean registerBean,
											@RequestParam(required = false) String[] additionalDomain) {
		
		HashMap<Object,Object> managerMap = new HashMap<Object, Object>();
		managerMap.put("id", registerBean.getId());
		managerMap.put("pw", registerBean.getPw());
		
		managerService.addFranchise(registerBean, managerMap, additionalDomain);
		
		return "manager/franchise_register_success";
	}
	
	@PostMapping("/manage_franchise_update_pro")
	public String manageFranchiseUpdatePro(@ModelAttribute FranchiseRegisterBean registerBean,
										@RequestParam(required = false) String[] additionalDomain) {
		
		HashMap<Object,Object> managerMap = new HashMap<Object, Object>();
		managerMap.put("id", registerBean.getId());
		managerMap.put("pw", registerBean.getPw());
		
		managerService.updateFranchise(registerBean, managerMap, additionalDomain);
		
		return "manager/franchise_update_success";
		
	}
	
}
