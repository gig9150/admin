package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.roomio.carret.bean.FranchiseRegisterBean;
import com.roomio.carret.service.ManagerAccountService;
import com.roomio.carret.service.ManagerService;
import com.roomio.carret.service.ShopService;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	private ManagerAccountService managerAccountService;
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private ShopService shopService;

	//매니저 아이디 중복체크 
	@GetMapping("/manager/idExistCheck/{id}")
	public String idExistCheck(@PathVariable String id) {
		
		boolean chk = managerAccountService.idExistCheck(id);
		
		return chk + "";
	}
	
	@GetMapping("/test/test")
	public List<FranchiseRegisterBean> test() {
		return managerService.getFranchiseList(1,"");
	}
	
	@GetMapping("/shop/getAreaDetail/{areaCode}")
	public List<HashMap<Object,Object>> getAreaSelect(@PathVariable int areaCode){
		
		return shopService.getAreaSigunguList(areaCode);
	}
	
	@GetMapping("/shop/getApplyInfo/{shopIdx}")
	public HashMap<Object,Object> getApplyInfo(@PathVariable int shopIdx,
													Model model){
		HashMap<Object,Object> applyInfoMap = shopService.getApplyInfo(shopIdx);
		model.addAttribute("applyInfoMap",applyInfoMap);
		
		return applyInfoMap;
	}
	
	@GetMapping("/shop/getImageInfo/{shopIdx}")
	public List<String> getImageInfo(@PathVariable int shopIdx){
		
		List<String> imageList = shopService.getAttachedImg(shopIdx);
		 return imageList;
		
	}
	
}
