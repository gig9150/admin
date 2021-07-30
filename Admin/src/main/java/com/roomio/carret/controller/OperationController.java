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
import com.roomio.carret.bean.QuestionRegisterBean;
import com.roomio.carret.service.OperationService;
import com.roomio.carret.service.ShopService;

@Controller
public class OperationController {

	@Autowired
	private OperationService operationService;
	
	@Autowired
	private ShopService shopService;
	
	@Resource(name = "loginManagerBean")
	@Lazy
	private LoginManagerBean loginManagerBean;
	
	//1:1문의 게시판
	
	@RequestMapping("/operation/question")
	public String question(@RequestParam(value="page",defaultValue = "1")int page,
								@RequestParam(defaultValue = "10")int selectNum,
								@ModelAttribute QuestionRegisterBean bean,
								Model model) {
		
		//가맹점 정보 
		List<HashMap<Object,Object>> fracnhiseList = shopService.getFranchiseName();
		model.addAttribute("franchiseList",fracnhiseList);
		
		//문의 카테고리 정보
		List<HashMap<Object,Object>> cateList = operationService.getQuestionCategory();
		model.addAttribute("cateList", cateList);
		
		//문의 리스트 및 글 갯수
		List<HashMap<Object,Object>> questionList = operationService.getQuestionList(page, bean, selectNum);
		PageBean pageBean = operationService.getQuestionCnt(page, bean, selectNum);
		int questionCnt = operationService.getQuestionRealCnt(page, bean);
		
		model.addAttribute("questionList",questionList);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("questionCnt",questionCnt);
		
		model.addAttribute("page",page);
		model.addAttribute("selectNum",selectNum);
		model.addAttribute("bean",bean);
		
		return "operation/question";
	}
	
	//1:1문의 답변 게시판(팝업)
	@RequestMapping("/operation/question_register")
	public String question_register(@RequestParam int questionId,
									Model model) {
		
		//문의 내용 얻어오기
		HashMap<Object,Object> quMap = operationService.getQuestion(questionId);
		model.addAttribute("quMap",quMap);
		
		//처리자명 정보 얻어오기
		String managerId  = loginManagerBean.getId();
		model.addAttribute("managerId",managerId);
		
		return "operation/question_register";
	}
	
	//1:1문의 답변 진행
	@RequestMapping("/operation/question_register_pro")
	public String question_register_pro(@RequestParam int questionId,
										@RequestParam String content,
										@RequestParam int sendMessage) {
		
		int franchiseManagerId = loginManagerBean.getFranchise_manager_id();
		
		operationService.addQuestionAnswer(questionId,content,sendMessage,franchiseManagerId);
		
		return "operation/question_register_pro";
	}
	
	// 신고문의 관리
	@RequestMapping("/operation/report")
	public String report(@RequestParam(value="page",defaultValue = "1")int page,
						@RequestParam(defaultValue = "10")int selectNum,
						@ModelAttribute QuestionRegisterBean bean,
						Model model
						) {
		
		//가맹점 정보 
		List<HashMap<Object,Object>> fracnhiseList = shopService.getFranchiseName();
		model.addAttribute("franchiseList",fracnhiseList);
		
		//문의 리스트 및 글 갯수
		List<HashMap<Object,Object>> reportList = operationService.getReportList(page, bean, selectNum);
		PageBean pageBean = operationService.getReportCnt(page, bean, selectNum);
		int reportCnt = operationService.getReportRealCnt(page, bean);
		
		model.addAttribute("reportList",reportList);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("reportCnt",reportCnt);
		
		model.addAttribute("page",page);
		model.addAttribute("selectNum",selectNum);
		model.addAttribute("bean",bean);
		
		
		return "operation/report";
	}
	
	// 신고문의 등록
	@RequestMapping("/operation/report_register")
	public String reportRegister(@RequestParam int reportId,
								Model model) {
				
		//문의 신고 내역 
		HashMap<Object,Object> reMap = operationService.getReportInfo(reportId);
		model.addAttribute("reMap",reMap);
		
		//처리자명 정보 얻어오기
		String managerId  = loginManagerBean.getId();
		model.addAttribute("managerId",managerId);
		
		return "operation/report_register";
	}
	
	//신고문의 등록진행
	@RequestMapping("/operation/report_register_pro")
	public String reportRegisterPro(@RequestParam int reportId,
								@RequestParam String content,
								@RequestParam int sendMessage) {
		
		int franchiseManagerId = loginManagerBean.getFranchise_manager_id();
		
		operationService.addReportReply(reportId, content, sendMessage, franchiseManagerId);
		
		return "operation/report_register_pro";
	}
	
	// FAQ 리스트페이지
	@RequestMapping("/operation/FAQ")
	public String FAQ(@RequestParam(value="page",defaultValue = "1")int page,
					@RequestParam(defaultValue = "10")int selectNum,
					@ModelAttribute FAQSearchBean bean,
					Model model) {
		
		// 가맹점 정보 
		List<HashMap<Object,Object>> franchiseList = shopService.getFranchiseName();
		model.addAttribute("franchiseList",franchiseList);
		
		List<HashMap<Object,Object>> list = operationService.getFAQList(page, bean, selectNum);
		PageBean pageBean = operationService.getFAQCnt(page, bean, selectNum);
		int freCnt = operationService.getFAQRealCnt(bean);
		
		model.addAttribute("list",list);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("freCnt",freCnt);
		
		model.addAttribute("page",page);
		model.addAttribute("selectNum",selectNum);
		model.addAttribute("bean",bean);
		
		return "operation/FAQ";
	}
	
	// FAQ 등록 페이지
	@RequestMapping("/operation/FAQ_register")
	public String FAQRegister(Model model) {
		
		// FAQ 카테고리 
		List<HashMap<Object,Object>> cateList = operationService.getFreQuestionCategory();
		model.addAttribute("cateList",cateList);
		
		// 가맹점 정보 
		List<HashMap<Object,Object>> fracnhiseList = shopService.getFranchiseName();
		model.addAttribute("franchiseList",fracnhiseList);
		
		return "operation/FAQ_register";
	}
	
	// FAQ 등록 페이지 진행
	@RequestMapping("/operation/FAQ_register_pro")
	public String FAQRegisterPro(@RequestParam int categoryId,
								@RequestParam List<Integer> franchiseId,
								@RequestParam String viewStatus,
								@RequestParam String title,
								@RequestParam String content) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("managerId",loginManagerBean.getFranchise_manager_id());
		map.put("categoryId", categoryId);
		map.put("viewStatus", viewStatus);
		map.put("title", title);
		map.put("content", content);
		
		operationService.addFAQ(map, franchiseId);
		
		return "account_manage/member_update";
		
	}
	
	// FAQ 수정 페이지
	@RequestMapping("/operation/FAQ_update")
	public String FAQUpdate(@RequestParam int id,
							Model model) {
		
		// FAQ 카테고리 
		List<HashMap<Object,Object>> cateList = operationService.getFreQuestionCategory();
		model.addAttribute("cateList",cateList);
		
		// 가맹점 정보
		List<HashMap<Object,Object>> fracnhiseList = shopService.getFranchiseName();
		model.addAttribute("franchiseList",fracnhiseList);
		
		//수정 input 정보
		HashMap<Object,Object> map = operationService.getFAQInfo(id);
		model.addAttribute("map",map);
		
		return "operation/FAQ_update";
		
	}
	
	// FAQ 수정 페이지 진행 
	@RequestMapping("/operation/FAQ_update_pro")
	public String FAQUpdatePro(@RequestParam int categoryId,
								@RequestParam int viewStatus,
								@RequestParam String title,
								@RequestParam String content,
								@RequestParam int id) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("categoryId", categoryId);
		map.put("viewStatus", viewStatus);
		map.put("title", title);
		map.put("content", content);
		map.put("id", id);
		
		operationService.updateFAQ(map);
		
		return "account_manage/member_update";
	}
	
	// FAQ 삭제 진행
	@RequestMapping("/operation/FAQ_delete")
	public String FAQDelete(@RequestParam int id) {
		
		operationService.deleteFAQ(id);
				
		return "account_manage/member_update";
	}
	
	//공지사항 리스트 페이지 이동
	@RequestMapping("/operation/notice")
	public String notice(@RequestParam(value="page",defaultValue = "1")int page,
					@RequestParam(defaultValue = "10")int selectNum,
					@ModelAttribute FAQSearchBean bean,
					Model model) {
		
		// 가맹점 정보 
		List<HashMap<Object,Object>> franchiseList = shopService.getFranchiseName();
		model.addAttribute("franchiseList",franchiseList);
		
		List<HashMap<Object,Object>> list = operationService.getNoticeList(page, bean, selectNum);
		PageBean pageBean = operationService.getNoticeCnt(page, bean, selectNum);
		int noticeCnt = operationService.getNoticeRealCnt(bean);
		
		model.addAttribute("list",list);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("noticeCnt",noticeCnt);
		
		model.addAttribute("page",page);
		model.addAttribute("selectNum",selectNum);
		model.addAttribute("bean",bean);
		
		return "operation/notice";
	}
	
	// 공지사항 등록 페이지
	@RequestMapping("/operation/notice_register")
	public String noticeRegister(Model model) {
		
		// FAQ 카테고리 
		List<HashMap<Object,Object>> cateList = operationService.getFreQuestionCategory();
		model.addAttribute("cateList",cateList);
		
		// 가맹점 정보 
		List<HashMap<Object,Object>> fracnhiseList = shopService.getFranchiseName();
		model.addAttribute("franchiseList",fracnhiseList);
		
		return "operation/notice_register";
	}
	
	// 공지사항 등록 페이지 진행
	@RequestMapping("/operation/notice_register_pro")
	public String noticeRegisterPro(@RequestParam String fixedStatus,
								@RequestParam List<Integer> franchiseId,
								@RequestParam String viewStatus,
								@RequestParam String title,
								@RequestParam String content) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("managerId",loginManagerBean.getFranchise_manager_id());
		map.put("fixedStatus", fixedStatus);
		map.put("viewStatus", viewStatus);
		map.put("title", title);
		map.put("content", content);
		
		operationService.addNotice(map, franchiseId);		
		
		return "account_manage/member_update";
		
	}
	
	// 공지사항 수정 페이지
	@RequestMapping("/operation/notice_update")
	public String noticeUpdate(@RequestParam int id,
							Model model) {
		
		// 가맹점 정보
		List<HashMap<Object,Object>> fracnhiseList = shopService.getFranchiseName();
		model.addAttribute("franchiseList",fracnhiseList);
		
		//수정 input 정보
		HashMap<Object,Object> map = operationService.getNoticeInfo(id);
		model.addAttribute("map",map);
		
		return "operation/notice_update";
		
	}
	
	// 공지사항 수정 페이지 진행 
	@RequestMapping("/operation/notice_update_pro")
	public String noticeUpdatePro(@RequestParam String fixedStatus,
								@RequestParam int viewStatus,
								@RequestParam String title,
								@RequestParam String content,
								@RequestParam int id) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("fixedStatus", fixedStatus);
		map.put("viewStatus", viewStatus);
		map.put("title", title);
		map.put("content", content);
		map.put("id", id);
		
		//수정
		operationService.updateNotice(map);
		
		return "account_manage/member_update";
	}
	
	// 공지사항 삭제 진행
	@RequestMapping("/operation/notice_delete")
	public String noticeDelete(@RequestParam int id) {
		
		//삭제
		operationService.deleteNotice(id);
				
		return "account_manage/member_update";
	}
	
	
	
}
