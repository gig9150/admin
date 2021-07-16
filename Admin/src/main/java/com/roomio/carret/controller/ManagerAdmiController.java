package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.roomio.carret.bean.LoginManagerBean;
import com.roomio.carret.bean.ManagerAddBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.service.ManagerAdmiService;
import com.roomio.carret.service.ShopService;

@Controller
public class ManagerAdmiController {
	
	@Autowired
	private ManagerAdmiService managerAdmiService;
	
	@Resource(name = "loginManagerBean")
	@Lazy
	private LoginManagerBean loginManagerBean;
	
	@Autowired
	private ShopService shopService;
	
	//매니저 역할 리스트 페이지
	@RequestMapping("/manager_admi/manager_role")
	public String managerRole(Model model,
								@RequestParam(required = false) String startDate,
								@RequestParam(required = false) String endDate,
								@RequestParam(value="page" , defaultValue = "1") int page,
								@RequestParam(defaultValue = "10") int selectNum,
								@RequestParam(required = false) String registrar,
								@RequestParam(required = false) String select,
								@RequestParam(required = false) String keyWord) {
		
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("startDate", startDate);
		map.put("endDate",endDate);
		map.put("registrar",registrar);
		map.put("select",select);
		map.put("keyWord",keyWord);
		
		List<HashMap<Object,Object>> list = managerAdmiService.getRoleList(page, map, selectNum);
		PageBean pageBean = managerAdmiService.getRoleCnt(page, map, selectNum);
		int roleCnt = managerAdmiService.getRoleRealCnt(map);
		
		
		model.addAttribute("list",list);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("roleCnt",roleCnt);
		model.addAttribute("map",map);
		model.addAttribute("selectNum",selectNum);
		model.addAttribute("page",page);
		
		return "manager_admi/manager_role";
	}
	
	//매니저 역할 등록
	@RequestMapping("/manager_admi/manager_role_register")
	public String managerRoleRegister() {
		

		return "manager_admi/manager_role_register";
	}
	
	//매니저 역할 등록 진행 
	@RequestMapping("/manager_admi/manager_role_register_pro")
	public String maanagerRoleRegisterPro(@RequestParam String roleGroupName,
										@RequestParam String roleGroupInfo,
										@RequestParam(required = false) int[] crud,
										@RequestParam(required = false) int[] role,
										@RequestParam(required = false) String menu1,
										@RequestParam(required = false) String menu2,
										@RequestParam(required = false) String menu3,
										@RequestParam(required = false) String menu4,
										@RequestParam(required = false) String menu5,
										@RequestParam(required = false) String menu6,
										@RequestParam(required = false) String menu7,
										@RequestParam(required = false) String menu8) {
		
		String detailRight = "";
		
		if(menu1 != null) detailRight += menu1;
		if(detailRight != "" && menu2 != null) {
			detailRight += "|"+menu2;
		}else if(menu2 != null){
			detailRight += menu2;
		}
		if(detailRight != "" && menu3 != null) {
			detailRight += "|"+menu3;
		}else if(menu3 != null){
			detailRight += menu3;
		}
		if(detailRight != "" && menu4 != null) {
			detailRight += "|"+menu4;
		}else if(menu4 != null){
			detailRight += menu4;
		}
		if(detailRight != "" && menu5 != null) {
			detailRight += "|"+menu5;
		}else if(menu5 != null) {
			detailRight += menu5;
		}
		if(detailRight != "" && menu6 != null) {
			detailRight += "|"+menu6;
		}else if(menu6 != null){
			detailRight += menu6;
		}
		if(detailRight != "" && menu7 != null) {
			detailRight += "|"+menu7;
		}else if(menu7 != null){
			detailRight += menu7;
		}
		if(detailRight != "" && menu8 != null) {
			detailRight += "|"+menu8;
		}else if(menu8 != null){
			detailRight += menu8;
		}
		
		System.out.println(detailRight);

		String registrar = loginManagerBean.getId();
		
		managerAdmiService.addRoleGroups(roleGroupName,roleGroupInfo,crud,role,registrar);
		
		return "manager_admi/manager_role";
	}
	
	//매니저 역할 수정 
	@RequestMapping("/manager_admi/manager_role_update")
	public String managerRoleUpdate(@RequestParam int roleGroupId,
									Model model) {
		
		HashMap<Object,Object> map = managerAdmiService.getRoleInfo(roleGroupId);
		model.addAttribute("map",map);
		
		
		
		return "manager_admi/manager_role_update";
	}
	
	//매니저 역할 수정 진행
	@RequestMapping("/manager_admi/manager_role_update_pro")
	public String managerRoleUpdatePro(@RequestParam int roleGroupId,
										@RequestParam String roleGroupName,
										@RequestParam String roleGroupInfo,
										@RequestParam(required = false) int[] crud,
										@RequestParam(required = false) int[] role,
										RedirectAttributes attr) {
		
		String registrar = loginManagerBean.getId();
		
		managerAdmiService.updateRoleGroups(roleGroupName,roleGroupInfo,crud,role,registrar,roleGroupId);
		attr.addAttribute("roleGroupId", roleGroupId);
		
		return "redirect:/manager_admi/manager_role_update";
	}
	
	//매니저 역할 삭제
	@RequestMapping("/manager_admi/manager_role_delete")
	public String managerRoleDelete(@RequestParam int roleGroupId) {
		
		managerAdmiService.deleteRole(roleGroupId);
		
		return "redirect:/manager_admi/manager_role";
	}
	
	//매니저 역할 전체삭제
	@RequestMapping("/manager_admi/manager_role_allDelete")
	public String managerRoleAlldelete(@RequestParam(value="idList") List<Integer> idList) {
	
		managerAdmiService.deleteAllRole(idList);
		
		return "redirect:/manager_admi/manager_role";
	}
	
	//매니저 계정 관리
	@RequestMapping("/manager_admi/manager_account")
	public String managerAccount(Model model,
								@RequestParam(required = false) String startDate,
								@RequestParam(required = false) String endDate,
								@RequestParam(value="page" , defaultValue = "1") int page,
								@RequestParam(defaultValue = "10") int selectNum,
								@RequestParam(required = false) String select,
								@RequestParam(required = false) String keyWord,
								@RequestParam(required = false) List<Integer> franchiseId) {
		
		//가맹점 정보
		List<HashMap<Object,Object>> franList = shopService.getFranchiseName();
		model.addAttribute("franList",franList);
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("startDate", startDate);
		map.put("endDate",endDate);
		map.put("select",select);
		map.put("keyWord",keyWord);
		map.put("franchiseId",franchiseId);
		
		//리스트 뽑아오기
		List<HashMap<Object,Object>> list = managerAdmiService.getAccountList(page, map, selectNum);
		PageBean pageBean = managerAdmiService.getAccountCnt(page, map, selectNum);
		int accountCnt = managerAdmiService.getAccountRealCnt(map);
		
		model.addAttribute("list",list);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("accountCnt",accountCnt);
		model.addAttribute("map",map);
		model.addAttribute("selectNum",selectNum);
		model.addAttribute("page",page);
		
		return "manager_admi/manager_account";
	}
	
	//매니저 계정 등록
	@RequestMapping("/manager_admi/manager_account_register")
	public String managerAccountRegister(Model model) {
		
		//가맹점 정보
		List<HashMap<Object,Object>> franList = shopService.getFranchiseName();
		model.addAttribute("franList",franList);
		
		//역할 정보
		List<HashMap<Object,Object>> roleList = managerAdmiService.getRoleName();
		model.addAttribute("roleList",roleList);
		
		return "manager_admi/manager_account_register";
	}
	
	// 매니저 계정 등록진행
	@RequestMapping("/manager_admi/manager_account_register_pro")
	public String managerAccountRegisterPro(@ModelAttribute ManagerAddBean bean,
											@RequestParam List<Integer> franchiseId) {
		
		//등록 
		managerAdmiService.managerRegister(bean, franchiseId);
		
		return "redirect:/manager_admi/manager_account";
	}
	
	//매니저 계정 수정
	@RequestMapping("/manager_admi/manager_account_update")
	public String managerAccountUpdate(Model model,
									@RequestParam int franchiseManagerId) {
		
		//가맹점 정보
		List<HashMap<Object,Object>> franList = shopService.getFranchiseName();
		model.addAttribute("franList",franList);
		
		//역할 정보
		List<HashMap<Object,Object>> roleList = managerAdmiService.getRoleName();
		model.addAttribute("roleList",roleList);
		
		//운영자 정보 
		HashMap<Object,Object> infoMap = managerAdmiService.getManagerInfo(franchiseManagerId);
		model.addAttribute("infoMap",infoMap);
		
		return "manager_admi/manager_account_update";
	}
	
	//매니저 계정 수정 진행
	@RequestMapping("/manager_admi/manager_account_update_pro")
	public String managerAccountUpdatePro(@ModelAttribute ManagerAddBean bean,
										@RequestParam List<Integer> franchiseId,
										RedirectAttributes attr) {
		
		managerAdmiService.updateManagerInfo(bean,franchiseId);
		attr.addAttribute("franchiseManagerId", bean.getFranchiseManagerId());
		
		return "redirect:/manager_admi/manager_account_update";
	}
	
	//매니저 삭제 
	@RequestMapping("/manager_admi/manager_account_delete")
	public String managerAccountDelete(@RequestParam int franchiseManagerId) {
		
		managerAdmiService.deleteManager(franchiseManagerId);
		
		return "redirect:/manager_admi/manager_account";
	}
}
