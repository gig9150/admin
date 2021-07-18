package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonObject;
import com.roomio.carret.bean.MemberSearchBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.service.AccountManageService;
import com.roomio.carret.service.ShopService;

@Controller
public class AccountManageController {
	
	@Autowired
	private AccountManageService accountManageService;
	
	@Autowired
	private ShopService shopService;

	
	//일반 회원 
	@RequestMapping("/account_manage/member")
	public String member(Model model,
						@ModelAttribute MemberSearchBean bean,
						@RequestParam(value="page" , defaultValue = "1") int page,
						@RequestParam(defaultValue = "10") int selectNum
						) {
		
		//지역정보
		List<HashMap<Object,Object>> areaList = accountManageService.getAreaList();
		model.addAttribute("areaList",areaList);

		//가맹점 정보
		List<HashMap<Object,Object>> franList = shopService.getFranchiseName();
		model.addAttribute("franList",franList);
		
		//일반 회원 리스트
		List<HashMap<Object,Object>> list = accountManageService.getMemberList(page, bean, selectNum);
		PageBean pageBean = accountManageService.getMemberCnt(page, bean, selectNum);
		int memberCnt = accountManageService.getMemberRealCnt(bean);
		
		model.addAttribute("list",list);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("memberCnt",memberCnt);
		model.addAttribute("page",page);
		model.addAttribute("selectNum",selectNum);
		model.addAttribute("bean",bean);

		return "account_manage/member";
	}
	
	//회원 상세 정보(팝업)
	@RequestMapping("/account_manage/member_detail")
	public String memberDetail(@RequestParam int memberId,
								Model model) {
		
		//회원 활동 내역
		HashMap actiMap = accountManageService.getMemberSta(memberId);
		model.addAttribute("actiMap",actiMap);
		
		//회원정보 수정 이력 
		List<HashMap<Object,Object>> upList = accountManageService.getMemberUpdate(memberId);
		model.addAttribute("upList",upList);
		
		//패널티 내역 
		List<HashMap<Object,Object>> peList = accountManageService.getMemberPenalty(memberId);
		model.addAttribute("peList",peList);
		
		model.addAttribute("memberId",memberId);
		
		return "account_manage/member_detail";
	}
	
	//회원 정보 수정
	@RequestMapping("/account_manage/member_update")
	public String memberUpdate(@RequestParam(required = false) int withdrawal,
								@RequestParam(required = false) String memo,
								@RequestParam(required = false) int memberId) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("withdrawal", withdrawal);
		map.put("memo",memo);
		map.put("memberId",memberId);
		
		//회원정보 수정 
		accountManageService.updateMemberInfo(memberId);
		
		return "account_manage/member_update";
	}
	
	//회원 패널티 적용(팝업)
	@RequestMapping("/account_manage/member_penalty")
	public String memberPenalty(@RequestParam int memberId) {
		
		
		return "account_manage/member_penalty";
	}
}
