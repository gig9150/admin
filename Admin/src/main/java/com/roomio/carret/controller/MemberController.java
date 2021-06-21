package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roomio.carret.bean.MemberManageBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.service.MemberService;
import com.roomio.carret.service.ShopService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private MemberService memberService;
	
	Logger Logger = LoggerFactory.getLogger(MemberController.class);

	@GetMapping("/manage_member")
	public String manage(Model model,
						@RequestParam(value="page",defaultValue = "1")int page,
						@ModelAttribute MemberManageBean memberManageBean
						) {
		
		//가맹점 명 
		List<HashMap<Object,Object>> franchiseNameList = shopService.getFranchiseName();
		model.addAttribute("franchiseNameList",franchiseNameList);
		
		//지역명
		List<HashMap<Object,Object>> areaList = shopService.getAreaList();
		model.addAttribute("areaList",areaList);
		
//		if(memberManageBean.getBaseArea() == 999) {
//			//경기도 지역의 세부지역정보
//			List<HashMap<Object,Object>> areaSigunguDefaultList = shopService.getAreaSigunguDefault();
//			model.addAttribute("areaSigunguDefaultList",areaSigunguDefaultList);
//		}else {
//			//타 지역 세부지역 정보 
//			List<HashMap<Object,Object>> areaSigunguDefaultList = shopService.getAreaSigunguList(memberManageBean.getBaseArea());
//			model.addAttribute("areaSigunguDefaultList",areaSigunguDefaultList);
//		}
		
		//경기도 지역의 세부지역정보
		List<HashMap<Object,Object>> areaSigunguDefaultList = shopService.getAreaSigunguDefault();
		model.addAttribute("areaSigunguDefaultList",areaSigunguDefaultList);
		
		PageBean pageBean = memberService.getShopApplyCnt(page, memberManageBean);
		model.addAttribute("pageBean",pageBean);
		
		List<HashMap<Object,Object>> memberList = memberService.getMemberList(page, memberManageBean);
		model.addAttribute("memberList",memberList);
		
		return "member/manage_member";
	}
	
	
}
