package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.ShopApplySearchBean;
import com.roomio.carret.bean.ShopSearchBean;
import com.roomio.carret.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	
	@GetMapping("/list")
	public String goShopList(Model model,
			@RequestParam(value="page",defaultValue = "1")int page,
			@ModelAttribute ShopSearchBean shopSearchBean,
			@RequestParam(value="baseArea",defaultValue = "00") int baseArea
			) {
		
		//가맹점 명 
		List<HashMap<Object,Object>> franchiseNameList = shopService.getFranchiseName();
		model.addAttribute("franchiseNameList",franchiseNameList);
		
		//왜 공백 생기는지 모르겟음..
		if(shopSearchBean.getKeyword() != null) {
			shopSearchBean.setKeyword(shopSearchBean.getKeyword().trim());
		}
		
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
		
		
		//가게 리스트
		List<HashMap<Object,Object>> shopList = shopService.getShopList(page,shopSearchBean);
		model.addAttribute("shopList",shopList);
		
		//총 리스트 갯수
		int shopListCnt = shopService.getShopRealCnt(shopSearchBean);
		model.addAttribute("shopListCnt",shopListCnt);
		
		//페이징 처리 빈
		PageBean pageBean = shopService.getShopCnt(page,shopSearchBean);
		model.addAttribute("pageBean",pageBean);
		
		model.addAttribute("baseArea",baseArea);
		
		
		
		return "shop/shop_list";
	}
	
	@GetMapping("/apply")
	public String shopApply(Model model,
			@RequestParam(value="page",defaultValue = "1")int page,
			@ModelAttribute ShopApplySearchBean shopApplySearchBean,
			@RequestParam(value="baseArea",defaultValue = "00") int baseArea) {

		
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
		
		//가게 신청 리스트
		List<HashMap<Object,Object>> shopApplyList = shopService.getShopApplyList(page, shopApplySearchBean);
		model.addAttribute("shopApplyList",shopApplyList);
		
		//페이지 처리 빈
		PageBean pageBean = shopService.getShopApplyCnt(page, shopApplySearchBean);
		model.addAttribute("pageBean",pageBean);
		
		model.addAttribute("baseArea",baseArea);

		return "shop/apply_shop";
		
	}
	
	@PostMapping("/apply_pro")
	public String applyPro(@RequestParam(required = false) String responsibilityMemo,
						@RequestParam String shopCode,
						@RequestParam(required = false)String returnReason,
						@RequestParam(required = false)String ok,
						@RequestParam(required = false)String no,
						@RequestParam(required = false)String keep,
						@RequestParam int shopIdx) {
		HashMap<Object,Object> applyInfoMap = new HashMap<Object,Object>();
		
		applyInfoMap.put("responsibilityMemo", responsibilityMemo);
		applyInfoMap.put("shopCode", shopCode);
		applyInfoMap.put("returnReason", returnReason);
		applyInfoMap.put("ok", ok);
		applyInfoMap.put("no", no);
		applyInfoMap.put("keep", keep);
		//map에 값 담기 
		applyInfoMap.put("shopIdx",shopIdx);
		
		shopService.updateShopApplyInfo(applyInfoMap);
		
		return "shop/apply_shop_success";
	}
	
	@GetMapping("/image_pop_up")
	public String imagePopUp(@RequestParam int shopIdx,
							Model model) {
		model.addAttribute("shopIdx",shopIdx);
		return "shop/image_pop_up";
		
	}
	
}
