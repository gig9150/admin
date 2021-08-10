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

import com.roomio.carret.bean.FAQSearchBean;
import com.roomio.carret.bean.LoginManagerBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.WordSearchBean;
import com.roomio.carret.service.ContentService;

@Controller
public class ContentController {

	@Autowired
	private ContentService contentService;
	
	@Resource(name = "loginManagerBean")
	@Lazy
	private LoginManagerBean loginManagerBean;
	
	//소식글 관리 페이지 이동
	@RequestMapping("/content/news_manage")
	public String newsManage() {
		
		
		return "content/news_manage";
	}
	
	//소식글 수정 페이지 이동
	@RequestMapping("/content/news_manage_add")
	public String newsManageRegister(@RequestParam int id,
									Model model) {
		
		//소식 상세페이지 정보
		HashMap<Object,Object> map = contentService.getNewsInfo(id);
		model.addAttribute("map",map);
		
		//소식 수정 이력 
		List<HashMap<Object,Object>> list = contentService.getNewsUpdateList(id);
		model.addAttribute("list",list);
		
		return "content/news_manage_add";
	}
	
	//금지어 관리
	@RequestMapping("/content/prohibited_word")
	public String prohibitedWord(@RequestParam(value="page",defaultValue = "1")int page,
								@RequestParam(defaultValue = "10")int selectNum,
								@ModelAttribute WordSearchBean bean,
								Model model) {
		
		List<HashMap<Object,Object>> list = contentService.getProWord(page, bean, selectNum);
		PageBean pageBean = contentService.getProWordCnt(page, bean, selectNum);
		int wordCnt = contentService.getProWordRealCnt(bean);
		
		model.addAttribute("list",list);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("wordCnt",wordCnt);
		
		model.addAttribute("page",page);
		model.addAttribute("selectNum",selectNum);
		model.addAttribute("bean",bean);
		
		return "content/prohibited_word";
		
	}
	
	
	//금지어 등록 
	@RequestMapping("/content/word_register")
	public String wordRegister() {
		
		return "content/word_register";
		
	}
	
	//금지어 등록 진행
	@RequestMapping("/content/word_register_pro")
	public String wordRegisterPro(@RequestParam(name = "keyword") List<String> keyword,
								@RequestParam(required = false) String textTitle,
								@RequestParam(required = false) String textContent,
								@RequestParam(required = false) String reviewContent) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("keyword", keyword);
		map.put("textTitle", textTitle);
		map.put("textContent", textContent);
		map.put("reviewContent", reviewContent);
		map.put("id",loginManagerBean.getFranchise_manager_id());
		
		contentService.addProWord(map);
		
		return "account_manage/member_update";
		
	}
	
}
