package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roomio.carret.service.ShopService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private ShopService shopService;

	@GetMapping("/manage_member")
	public String manage(Model model,
						@RequestParam(value="baseArea",defaultValue = "00") int baseArea,
						@RequestParam(value="page",defaultValue = "1")int page
						) {
		
		//가맹점 명 
		List<HashMap<Object,Object>> franchiseNameList = shopService.getFranchiseName();
		model.addAttribute("franchiseNameList",franchiseNameList);
		
		//지역명
		List<HashMap<Object,Object>> areaList = shopService.getAreaList();
		model.addAttribute("areaList",areaList);
		
		if(baseArea == 00) {
			//경기도 지역의 세부지역정보
			List<HashMap<Object,Object>> areaSigunguDefaultList = shopService.getAreaSigunguDefault();
			model.addAttribute("areaSigunguDefaultList",areaSigunguDefaultList);
		}else {
			//타 지역 세부지역 정보 
			List<HashMap<Object,Object>> areaSigunguDefaultList = shopService.getAreaSigunguList(baseArea);
			model.addAttribute("areaSigunguDefaultList",areaSigunguDefaultList);
		}
		
		return "member/manage_member";
	}
}
