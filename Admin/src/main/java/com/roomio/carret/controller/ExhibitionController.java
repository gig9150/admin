package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roomio.carret.bean.CurationRegisterBean;
import com.roomio.carret.bean.CurationSearchBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.service.ExhibitionService;
import com.roomio.carret.service.ShopService;

@Controller
public class ExhibitionController {
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private ExhibitionService exhibitionService;

	
	//기획전 리스트 페이지
	@RequestMapping("/exhibition/curation_list")
	public String curationList(Model model,
							@RequestParam(required = false , defaultValue = "1")int page,
							@ModelAttribute CurationSearchBean curationSearchBean
							) {
		
//		//가맹사 정보
//		List<HashMap<Object,Object>> franchiseList = shopService.getFranchiseName();
//		model.addAttribute("franchiseList",franchiseList);
//		
//		//기획전 리스트
//		List<HashMap<Object,Object>> curationList = exhibitionService.getCurationList(page, curationSearchBean);
//		model.addAttribute("curationList",curationList);
//		
//		//기획전 페이징 처리 
//		PageBean pageBean = exhibitionService.getCurationCnt(page, curationSearchBean);
//		model.addAttribute("pageBean",pageBean);
//		
//		//리스트 갯수
//		int curationCnt = exhibitionService.getCurationRealCnt(page, curationSearchBean);
//		model.addAttribute("curationCnt",curationCnt);
		
		
		return "exhibition/curation_list";
	}
	
	//기획전 등록 페이지 이동
	@RequestMapping("/exhibition/curation_apply")
	public String curationApply(Model model) {
		//가맹사 정보
		List<HashMap<Object,Object>> franchiseList = shopService.getFranchiseName();
		model.addAttribute("franchiseList",franchiseList);
		
		return "exhibition/curation_apply";
	}
	
	//기획전 등록
	@RequestMapping("/exhibition/curation_apply_pro")
	public String curationApplyPro(@ModelAttribute CurationRegisterBean curationRegisterBean,
								@RequestParam(required = false) List<Integer> shopIdx) {
		
		exhibitionService.addNewCuration(curationRegisterBean,shopIdx);
		
		return "exhibition/curation_apply_pro";
	}
	
	//기획전 수정 페이지 이동
	@RequestMapping("/exhibition/curation_update")
	public String curationUpdate(Model model,
								@RequestParam int shopExhiId) {
		//가맹사 정보
		List<HashMap<Object,Object>> franchiseList = shopService.getFranchiseName();
		model.addAttribute("franchiseList",franchiseList);
		
		HashMap<Object,Object> exhiMap = exhibitionService.getExhibition(shopExhiId);
		model.addAttribute("exhiMap",exhiMap);
		
		model.addAttribute("shopExhiId",shopExhiId);

		return "exhibition/curation_update";
	}
	
	//기획전 수정 
	@RequestMapping("/exhibition/curation_update_pro")
	public String curationUpdatePro(@ModelAttribute CurationRegisterBean curationRegisterBean,
								@RequestParam(required = false) List<Integer> shopIdx) {
		
		
		exhibitionService.updateCuration(curationRegisterBean,shopIdx);
		
		return "exhibition/curation_update_pro";
	}
	
	//가게 홍보페이지 관리 
	@RequestMapping("/exhibition/promotion_account")
	public String promotionAccount() {
		
		return "exhibition/promotion_account";
	}
	
	//메인 홈페이지 관리 페이지 
}
