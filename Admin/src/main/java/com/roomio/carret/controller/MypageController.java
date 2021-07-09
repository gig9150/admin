package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.roomio.carret.bean.LoginMemberBean;
import com.roomio.carret.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	//단골 페이지 이동
	@RequestMapping("/front/mypage/bookmark")
	public String bookmark(Model model) {
		
		// 단골 페이지 list
		// 나중에 로그인 객체에서 값 받아와서 파라미터로 넘겨주기★★
//		List<HashMap<Object,Object>> bookmartList = mypageService.getFrontBookmarkShop(memberId);
//		model.addAttribute("bookmartList",bookmartList);

		return "front/mypage/bookmark";
	}
	
	//가게 후기 페이지 이동
	@RequestMapping("/front/mypage/shop_review")
	public String shopReview(Model model) {
		
		//후기 페이지 list
		//나중에 로그인 객체에서 값 받아와서 파라미터로 넘겨주기★★
//		List<HashMap<Object,Object>> reviewList = mypageService.getFrontReviewShop(memberId);
//		model.addAttribute("reviewList",reviewList);
		
		
		return "front/mypage/shop_review";
	}
	//1:1 문의 카테고리 페이지 이동
	@RequestMapping("/front/mypage/question_category")
	public String question() {
		
		return "front/mypage/question_category";
		
	}
	
	//1:1 문의 작성 페이지 이동
	@RequestMapping("/front/mypage/question_register")
	public String questionRegister(Model model) {
		
		//나중에 로그인 객체의 값에서 memberId값 꺼내서 파라미터로 넣어주기★★
		//맴버 정보 map 
		HashMap<Object,Object> memberMap = mypageService.getFrontQuestionMemberInfo(1);
		model.addAttribute("memberMap",memberMap);
		
		//카테고리 정보 list
		List<HashMap<Object,Object>> categoryList = mypageService.getFrontQuestionCategory();
		model.addAttribute("categoryList",categoryList);
		
		return "front/mypage/question_register";
	
	}
	
	//1:1 문의 작성 완료
	@RequestMapping("/front/mypage/question_register_pro")
	public String questionRegisterPro(@RequestParam int questionCategoryId,
									@RequestParam String questionContent,
									@RequestParam(value="questionImg",required = false) List<MultipartFile> file) {
		
		//parameter info
		//questionCategoryId : 카테고리 번호 
		//questionContent : 문의 내용
		//file : 문의 이미지 
		
		HashMap<Object,Object> questionMap = new HashMap<Object,Object>();
		
		//나중에 로그인 객체의 값에서 memberId값 꺼내서 파라미터로 넣어주기★★
		questionMap.put("memberId",1);
		questionMap.put("questionCategoryId", questionCategoryId);
		questionMap.put("questionContent",questionContent);
		
		mypageService.addFrontMemberQuestion(questionMap, file);
		
		return "front/mypage/question_register_pro";
		
	}
	
	//나의 문의내역 확인하기
	@RequestMapping("/front/mypage/my_question")
	public String myQuestion(Model model) {
		
		//나의 문의 페이지 list
		//나중에 로그인 객체에서 값 받아와서 파라미터로 넘겨주기★★
//		List<HashMap<Object,Object>> questionList = mypageService.getFrontMemberQuestion(memberId);
//		model.addAttribute("questionList",questionList);
		
		
		return "front/mypage/my_question";
		
	}
	
	//자주묻는 질문 카테고리 페이지 이동 
	@RequestMapping("/front/mypage/frequent_question_category")
	public String frequentQuestionCategory(Model model) {
		
		//자주묻는 질문 카테고리 리스트
		//하위 카테고리는 클릭할때마다 ajax로 받아오기(그건 아직 안함..)
		List<String> categoryList = mypageService.getFrontFrequentQuestionCategory();
		model.addAttribute("categoryList",categoryList);
		
		return "front/mypage/frequent_question_category";
		
	}
	
	//자주묻는 질문 상세 페이지
	@RequestMapping("/front/mypage/frequent_question")
	public String frequentQuestion(@RequestParam int frequentQuestionId,
									Model model) {
		
		//자주 묻는 질문 상세정보 map
		HashMap<Object,Object> fqMap = mypageService.getFrontFrequentQuestion(frequentQuestionId);
		model.addAttribute("fqMap",fqMap);
		
		return "front/mypage/frequent_question";
		
	}
	
	//공지사항 페이지 이동
	@RequestMapping("/front/mypage/notice")
	public String notice(Model model) {
		
		//공지사항 list
		List<HashMap<Object,Object>> noticeList = mypageService.getFrontNotice();
		model.addAttribute("noticeList",noticeList);
		
		return "front/mypage/notice";
		
	}
	
	//공지사항 상세 페이지 이동
	@RequestMapping("/front/mypage/notice_detail")
	public String notice(@RequestParam int noticeId,
						Model model) {
		
		//공지사항 디테일 페이지 map
		HashMap<Object,Object> noticeDetailMap = mypageService.getFrontNoticeDetail(noticeId);
		model.addAttribute("noticeDetailMap",noticeDetailMap);
		
		return "front/mypage/notice_detail";
		
	}
	
	//여기부터
	
	//회원 탈퇴 페이지 이동
	@RequestMapping("/front/mypage/withdrawal")
	public String withdrawal() {
		
		return "front/mypage/withdrawal";
		
	}
	
	//회원 탈퇴 완료 
	@RequestMapping("/front/mypage/withdrawal_pror")
	public String withdrawalPro() {
		
		return "front/mypage/withdrawal_pro";
		
	}
	
	//여기까지는 안함 
	
	
}
