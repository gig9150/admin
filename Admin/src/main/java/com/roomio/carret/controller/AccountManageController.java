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
import com.roomio.carret.bean.PenaltySearchBean;
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
		
		//가게 리스트
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
	
	//가게 패널티 등록
	@RequestMapping("/account_manage/shop_penalty_register")
	public String shopPenaltyRegi(@RequestParam HashMap<Object,Object> map) {
		
		//등록자
		map.put("register",loginManagerBean.getId());
		
		//패널티 등록 
		accountManageService.addShopPenalty(map);
		
		return "account_manage/member_update";
	}
	
	//가게 신청 심사 페이지 이동
	@RequestMapping("/account_manage/shop_apply_list")
	public String shopApplyList(Model model,
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
		
		//가게 리스트
		List<HashMap<Object,Object>> list = accountManageService.getShopApplyList(page, bean, selectNum);
		PageBean pageBean = accountManageService.getShopApplyCnt(page, bean, selectNum);
		int shopCnt = accountManageService.getShopApplyRealCnt(bean);
		
		
		model.addAttribute("list",list);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("shopCnt",shopCnt);
		
		model.addAttribute("page",page);
		model.addAttribute("selectNum",selectNum);
		model.addAttribute("bean",bean);
		
		return "account_manage/shop_apply_list"; 
	}
	
	//가게 신청 심사 처리 페이지
	@RequestMapping("/account_manage/shop_apply_detail")
	public String shopApplyDetail(@RequestParam int shopIdx,
								Model model) {
		
		HashMap<Object,Object> map = accountManageService.getShopApplyInfo(shopIdx);
		List<HashMap<Object,Object>> list = accountManageService.getShopHold(shopIdx);
		
		model.addAttribute("map",map);
		model.addAttribute("list",list);
		model.addAttribute("shopIdx",shopIdx);
		
		//뿌리는거 이어서 하기
		
		return "account_manage/shop_apply_detail";
	}
	
	//사업장 등록증 팝업
	@RequestMapping("/account_manage/buisness_image")
	public String buisnessImage(@RequestParam String imageName,
								Model model) {
		
		model.addAttribute("imageName",imageName);
		
		return "account_manage/buisness_image";
	}
	
	//가게 신청 처리
	@RequestMapping("/account_manage/shop_apply_pro")
	public String shopApplyPro(@RequestParam int shopIdx,
								@RequestParam String reason,
								@RequestParam int status,
								@RequestParam String memo) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("shopIdx", shopIdx);
		map.put("reason", reason);
		map.put("status",status);
		map.put("memo",memo);
				
		accountManageService.updateShopStatus(map);
		
		return "account_manage/member_update";
		
	}
	
	//맴버 패널티 관리
	@RequestMapping("/account_manage/penalty")
	public String penalty(Model model,
						@ModelAttribute PenaltySearchBean bean,
						@RequestParam(value="page" , defaultValue = "1") int page,
						@RequestParam(defaultValue = "10") int selectNum) {
		
		//지역정보
		List<HashMap<Object,Object>> areaList = accountManageService.getAreaList();
		model.addAttribute("areaList",areaList);
	
		//가맹점 정보
		List<HashMap<Object,Object>> franList = shopService.getFranchiseName();
		model.addAttribute("franList",franList);
		
		//가게 리스트
		List<HashMap<Object,Object>> list = accountManageService.getMemPenalty(page, bean, selectNum);
		PageBean pageBean = accountManageService.getMemPenaltyCnt(page, bean, selectNum);
		int peCnt = accountManageService.getMemPenaltyRealCnt(bean);
		
		
		model.addAttribute("list",list);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("peCnt",peCnt);
		
		model.addAttribute("page",page);
		model.addAttribute("selectNum",selectNum);
		model.addAttribute("bean",bean);
		
		return "account_manage/penalty";
		
	}
	
	//맴버 패널티 상세 
	@RequestMapping("/account_manage/penalty_detail")
	public String penaltyDetail(@RequestParam(value="page" , defaultValue = "1") int page,
								@RequestParam int memberPenaltyId,
								Model model) {

		//패널티 페이지 필요한 정보
		HashMap<Object,Object> memMap = accountManageService.getMemPenaltyInfo(memberPenaltyId);
		
		//패널티 수정 이력 
		List<HashMap<Object,Object>> list = accountManageService.getMemPeUpdate(page, memberPenaltyId);
		PageBean pageBean = accountManageService.getMemPeUpdateCnt(page, memberPenaltyId);
		int upCnt = accountManageService.getMemPeUpdateRealCnt(memberPenaltyId);
		
		model.addAttribute("memberPenaltyId",memberPenaltyId);
		model.addAttribute("memMap",memMap);
		model.addAttribute("list",list);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("upCnt",upCnt);
		model.addAttribute("page",page);
		
		return "account_manage/penalty_detail";
		
	}
	
	//맴버 패널티 수정 
	@RequestMapping("/account_manage/penalty_detail_pro")
	public String penaltyDetailPro(@RequestParam HashMap<Object,Object> map) {
		
		map.put("register",loginManagerBean.getId());
		
		accountManageService.updateMemPenalty(map);
		
		return "account_manage/member_update";
		
	}
	
	//가게 패널티
	@RequestMapping("/account_manage/shop_penalty_list")
	public String shopPenaltyList(Model model,
							@ModelAttribute PenaltySearchBean bean,
							@RequestParam(value="page" , defaultValue = "1") int page,
							@RequestParam(defaultValue = "10") int selectNum) {
	
		//지역정보
		List<HashMap<Object,Object>> areaList = accountManageService.getAreaList();
		model.addAttribute("areaList",areaList);
	
		//가맹점 정보
		List<HashMap<Object,Object>> franList = shopService.getFranchiseName();
		model.addAttribute("franList",franList);
		
		//가게 리스트
		List<HashMap<Object,Object>> list = accountManageService.getShopPenalty(page, bean, selectNum);
		PageBean pageBean = accountManageService.getShopPenaltyCount(page, bean, selectNum);
		int peCnt = accountManageService.getShopPenaltyRealCount(bean);
		
		
		model.addAttribute("list",list);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("peCnt",peCnt);
		
		model.addAttribute("page",page);
		model.addAttribute("selectNum",selectNum);
		model.addAttribute("bean",bean);
		
		return "account_manage/shop_penalty_list";
		
	}
	
	//가게 패널티 상세 
	@RequestMapping("/account_manage/shop_penalty_detail")
	public String shopPenaltyDetail(@RequestParam(value="page" , defaultValue = "1") int page,
									@RequestParam int shopPenaltyId,
									Model model) {
		
		HashMap<Object,Object> memMap = accountManageService.getShopPenaltyInfo(shopPenaltyId);
		
		//패널티 수정 이력 
		List<HashMap<Object,Object>> list = accountManageService.getShopPeUpdate(page, shopPenaltyId);
		PageBean pageBean = accountManageService.getShopPeUpdateCnt(page, shopPenaltyId);
		int upCnt = accountManageService.getShopPeUpdateRealCnt(shopPenaltyId);
		
		
		model.addAttribute("shopPenaltyId",shopPenaltyId);
		model.addAttribute("memMap",memMap);
		model.addAttribute("list",list);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("upCnt",upCnt);
		model.addAttribute("page",page);
		
		return "account_manage/shop_penalty_detail";
	}
	
	//맴버 패널티 수정 
	@RequestMapping("/account_manage/shop_penalty_detail_pro")
	public String shopPenaltyDetailPro(@RequestParam HashMap<Object,Object> map) {
		
		map.put("register",loginManagerBean.getId());
		
		accountManageService.updateShopPenalty(map);
		
		return "account_manage/member_update";
		
	}
	
	//소식글 관리 페이지 이동
	@RequestMapping("/account_manage/news_manage")
	public String newsManage() {
		
		
		return "account_manage/news_manage";
	}

}
