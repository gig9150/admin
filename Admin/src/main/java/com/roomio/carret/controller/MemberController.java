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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.roomio.carret.bean.MemberManageBean;
import com.roomio.carret.bean.MemberPenaltyBean;
import com.roomio.carret.bean.MemberRegisterBean;
import com.roomio.carret.bean.MemberUpdateBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.service.MemberService;
import com.roomio.carret.service.ShopService;

@Controller
public class MemberController {
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private MemberService memberService;
	
	Logger Logger = LoggerFactory.getLogger(MemberController.class);

	@GetMapping("/member/manage_member")
	public String manageMember(Model model,
						@RequestParam(value="page",defaultValue = "1")int page,
						@ModelAttribute MemberManageBean memberManageBean
						) {
		
		//가맹점 명 
		List<HashMap<Object,Object>> franchiseNameList = shopService.getFranchiseName();
		model.addAttribute("franchiseNameList",franchiseNameList);
		
		//지역명
		List<HashMap<Object,Object>> areaList = shopService.getAreaList();
		model.addAttribute("areaList",areaList);
		
//		if(memberManageBean.getBaseArea() == 0) {
//			//경기도 지역의 세부지역정보
//			List<HashMap<Object,Object>> areaSigunguDefaultList = shopService.getAreaSigunguDefault();
//			model.addAttribute("areaSigunguDefaultList",areaSigunguDefaultList);
//		}else {
//			//타 지역 세부지역 정보 
//			List<HashMap<Object,Object>> areaSigunguDefaultList = shopService.getAreaSigunguList(memberManageBean.getBaseArea());
//			model.addAttribute("areaSigunguDefaultList",areaSigunguDefaultList);
//		}
		
		PageBean pageBean = memberService.getShopApplyCnt(page, memberManageBean);
		model.addAttribute("pageBean",pageBean);
		
		List<HashMap<Object,Object>> memberList = memberService.getMemberList(page, memberManageBean);
		model.addAttribute("memberList",memberList);
		
		return "member/manage_member";
	}
	
	@GetMapping("/member/manage_penalty")
	public String managePenalty(Model model,
			@RequestParam(value="page",defaultValue = "1")int page,
			@ModelAttribute MemberPenaltyBean memberPenaltyBean) {
		
		//가맹점 명 
		List<HashMap<Object,Object>> franchiseNameList = shopService.getFranchiseName();
		model.addAttribute("franchiseNameList",franchiseNameList);
		
		//지역명
		List<HashMap<Object,Object>> areaList = shopService.getAreaList();
		model.addAttribute("areaList",areaList);
		
		if(memberPenaltyBean.getBaseArea() == 0) {
			
			//경기도 지역의 세부지역정보
			List<HashMap<Object,Object>> areaSigunguDefaultList = shopService.getAreaSigunguDefault();
			model.addAttribute("areaSigunguDefaultList",areaSigunguDefaultList);
			
		}else {
			
			//타 지역 세부지역 정보 
			List<HashMap<Object,Object>> areaSigunguDefaultList = shopService.getAreaSigunguList(memberPenaltyBean.getBaseArea());
			model.addAttribute("areaSigunguDefaultList",areaSigunguDefaultList);
			
		}
		
		PageBean pageBean = memberService.getMemberPenaltyCnt(page, memberPenaltyBean);
		model.addAttribute("pageBean",pageBean);
		
		List<HashMap<Object,Object>> penaltyList = memberService.getMemberPenaltyList(page, memberPenaltyBean);
		model.addAttribute("penaltyList",penaltyList);
		
		return "member/manage_penalty";
	}
	
	//일반 회원 가입 
	@GetMapping("/front/member/member_join")
	public String memberJoin(Model model) {
		
		//가맹사 코드 받으면 값 뽑아서 메인페이지로 이동
		
		return "front/member/member_join";
	}
	
	//일반 회원 가입 진행
	@PostMapping("/front/member/member_join_pro")
	public String memberJoinPro(@ModelAttribute MemberRegisterBean memberRegisterBean) {
		
		//나중에 연동 정확히 나오면 주소값과 같이 받아주기 ★★
		
		memberService.addFrontMember(memberRegisterBean);
		
		return "front/member/member_join_success";
		
	}
	
	
	
	
}
