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

import com.google.gson.JsonObject;
import com.roomio.carret.bean.LoginManagerBean;
import com.roomio.carret.bean.MemberSearchBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.ShopUpdateBean;
import com.roomio.carret.service.AccountManageService;
import com.roomio.carret.service.ShopService;

@Controller
public class AccountManageController {
	
	@Autowired
	private AccountManageService accountManageService;
	
	@Autowired
	private ShopService shopService;
	
	@Resource(name = "loginManagerBean")
	@Lazy
	private LoginManagerBean loginManagerBean;

	
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
	public String memberPenalty(@RequestParam HashMap<Object,Object> memMap,
								@RequestParam(value="page" , defaultValue = "1") int page,
								Model model) {
		
		//기본 회원 정보
		model.addAttribute("memMap",memMap);
		
		//패널티 리스트 정보
		List<HashMap<Object,Object>> peList = accountManageService.getMemberPenaltyList(page, Integer.parseInt((String)memMap.get("memberId")));
		PageBean pageBean = accountManageService.getMemberPenaltyCnt(page, Integer.parseInt((String)memMap.get("memberId")));
		int peCnt = accountManageService.getMemberPenaltyRealCnt(Integer.parseInt((String)memMap.get("memberId")));
		
		model.addAttribute("peList",peList);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("peCnt",peCnt);
		
		model.addAttribute("page",page);
		model.addAttribute("memMap",memMap);
		
		return "account_manage/member_penalty";
	}
	
	//회원 패널티 적용
	@RequestMapping("/account_manage/member_penalty_register")
	public String memberPenaltyRegi(@RequestParam HashMap<Object,Object> map) {
		
		//등록자
		map.put("register",loginManagerBean.getId());
		
		//패널티 등록 
		accountManageService.addMemberPenalty(map);
		
		return "account_manage/member_update";
	}
	
	//회원 패널티 해지
	
	//가게 리스트 이동
	@RequestMapping("/account_manage/shop_list")
	public String shopList(Model model,
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
		
		//업종 정보
		List<HashMap<Object,Object>> secList = accountManageService.getSectorList();
		model.addAttribute("secList",secList);
		
		//가기 리스트
		List<HashMap<Object,Object>> list = accountManageService.getShopList(page, bean, selectNum);
		PageBean pageBean = accountManageService.getShopCnt(page, bean, selectNum);
		int shopCnt = accountManageService.getShopRealCnt(bean);
		
		
		model.addAttribute("list",list);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("shopCnt",shopCnt);
		
		model.addAttribute("page",page);
		model.addAttribute("selectNum",selectNum);
		model.addAttribute("bean",bean);
		
		
		return "account_manage/shop_list";
	}
	
	//가게 상세 페이지 이동
	@RequestMapping("/account_manage/shop_detail")
	public String shopDetail(@RequestParam int shopIdx,
							Model model) {
		
		//상세페이지 필요한 정보
		HashMap<Object,Object> map = accountManageService.getShopDeatil(shopIdx);
		HashMap<Object,Object> deMap = accountManageService.getShopDetailTwo(shopIdx);
		List<HashMap<Object,Object>> list = accountManageService.getShopDetailThree(shopIdx);
		
		//업종 정보
		List<HashMap<Object,Object>> secList = accountManageService.getSectorList();
		model.addAttribute("secList",secList);
		
		//가게 수정 이력
		List<HashMap<Object,Object>> upList = accountManageService.getShopUpdateList(shopIdx);
		model.addAttribute("upList",upList);
		
		//가게 패널티 정보
		List<HashMap<Object,Object>> peList = accountManageService.getShopPenaltyList(shopIdx);
		model.addAttribute("peList",peList);
		
		model.addAttribute("map",map);
		model.addAttribute("deMap",deMap);
		model.addAttribute("list",list);
		
		return "account_manage/shop_detail";
	}
	
	//가게 정보 수정
	@RequestMapping("/account_manage/shop_update")
	public String shopUpdate(@ModelAttribute ShopUpdateBean bean) {
		
		//가게 정보 수정 
		accountManageService.shopUpdate(bean);
		
		return "account_manage/shop_update";
	}
	
	//가게 패널티 이동
	@RequestMapping("/account_manage/shop_penalty")
	public String shopPenalty(@RequestParam HashMap<Object,Object> shopMap,
							@RequestParam(value="page" , defaultValue = "1") int page,
							Model model) {
		
		//기본 회원 정보
		model.addAttribute("shopMap",shopMap);
		
		//패널티 리스트 정보
		List<HashMap<Object,Object>> peList = accountManageService.getShopPenalty(page, Integer.parseInt((String)shopMap.get("shopIdx")));
		PageBean pageBean = accountManageService.getShopPenaltyCnt(page, Integer.parseInt((String)shopMap.get("shopIdx")));
		int peCnt = accountManageService.getShopPenaltyRealCnt(Integer.parseInt((String)shopMap.get("shopIdx")));
		
		model.addAttribute("peList",peList);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("peCnt",peCnt);
		
		model.addAttribute("page",page);
		
		return "account_manage/shop_penalty";
	}
	
	@RequestMapping("/account_manage/shop_penalty_register")
	public String shopPenaltyRegi(@RequestParam HashMap<Object,Object> map) {
		
		//등록자
		map.put("register",loginManagerBean.getId());
		
		//패널티 등록 
		accountManageService.addShopPenalty(map);
		
		return "account_manage/member_update";
	}

}
