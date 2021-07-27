package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.roomio.carret.bean.LoginMemberBean;
import com.roomio.carret.bean.MemberUpdateBean;
import com.roomio.carret.bean.ProfileUpdateBean;
import com.roomio.carret.bean.ShopInfoUpdateBean;
import com.roomio.carret.bean.ShopRegisterBean;
import com.roomio.carret.service.AccountManageService;
import com.roomio.carret.service.MemberService;
import com.roomio.carret.service.MypageService;
import com.roomio.carret.service.ShopService;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private AccountManageService accountManageService;
	
	//일반 유저 마이페이지 이동
	@GetMapping("/front/myPage")
	public String myPage(Model model) {
		
		//나중에 로그인 객체에서 값 넣어주기 ★★
		List<HashMap<Object,Object>> shopList = mypageService.getMyShop(1);
		model.addAttribute("shopList",shopList);
		
		return "front/mypage/mypage";
	}
	
	//자기 가게 입장
	@RequestMapping("/front/mypage/shop")
	public String shop(@RequestParam int shopIdx,
						Model model) {
		model.addAttribute("shopIdx",shopIdx);
		
		//가게 정보 
		HashMap<Object,Object> map = shopService.getFrontShopDetail(shopIdx);
		model.addAttribute("map",map);
		
		
		return "front/mypage/shop";
		
	}
	
	// 가게 정보 수정
	@RequestMapping("/front/mypage/shop_update")
	public String shopUpdate(@RequestParam int shopIdx,
							Model model) {
		
		model.addAttribute("shopIdx",shopIdx);
		
		return "front/mypage/shop_update";
		
	}
	
	//가게 정보 수정 진행
	@RequestMapping("/front/mypage/shop_update_pro")
	public String shopUpdatePro(@ModelAttribute ShopInfoUpdateBean bean,
								RedirectAttributes attr) {
		//가게 정보 수정
		mypageService.updateShopInfo(bean);
		
		attr.addAttribute("shopIdx", bean.getShopIdx());
		
		return "redirect:/front/mypage/shop";
		
	}
	
	// 가격표 관리
	@RequestMapping("/front/mypage/goods_manage")
	public String goodsManage(@RequestParam int shopIdx,
								Model model) {
		
		List<HashMap<Object,Object>> list = mypageService.getGoodsList(shopIdx);
		model.addAttribute("list",list);
		
		model.addAttribute("shopIdx",shopIdx);
		
		return "front/mypage/goods_manage";
	}
	
	//가격표 등록
	@RequestMapping("/front/mypage/goods_add")
	public String goodsAdd(@RequestParam int shopIdx,
							Model model) {
		
		model.addAttribute("shopIdx",shopIdx);
		
		return "front/mypage/goods_add";
	}
	
	//가격표 등록 진행
	@RequestMapping("/front/mypage/goods_add_pro")
	public String goodsAddPro(RedirectAttributes attr,
							@RequestParam int shopIdx,
							@RequestParam String name,
							@RequestParam(required = false) String best,
							@RequestParam(required = false) String price,
							@RequestParam(required = false) String minPrice,
							@RequestParam(required = false) String additionalInfo) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("shopIdx",shopIdx);
		map.put("name", name);
		if(map.get("price") != null && best.equals("on")) {
			map.put("best", 1);
		}else {
			map.put("best", 2);
		}
		map.put("price",price);
		map.put("minPrice",minPrice);
		map.put("additionalInfo",additionalInfo);
		
		//가격표 추가
		mypageService.addGoods(map);
		
		attr.addAttribute("shopIdx",shopIdx);
		
		return "redirect:/front/mypage/shop";
	}
	
	//가격표 수정
	@RequestMapping("/front/mypage/goods_update")
	public String goodUpdate(@RequestParam int goodsId,
							@RequestParam int shopIdx,
							Model model) {
		
		model.addAttribute("goodsId",goodsId);
		model.addAttribute("shopIdx",shopIdx);
		
		HashMap<Object,Object> map = mypageService.getGoodsInfo(goodsId);
		
		if(map.get("price") != null && map.get("price") != null) {
			map.put("state",1);
		}else {
			map.put("state",2);
		}
		
		model.addAttribute("map",map);
		
		return "front/mypage/goods_update";
		
	}
	
	//가격표 수정 진행
	@RequestMapping("/front/mypage/goods_update_pro")
	public String goodUpdatePro(RedirectAttributes attr,
								@RequestParam int shopIdx,
								@RequestParam int goodsId,
								@RequestParam String name,
								@RequestParam(required = false) String best,
								@RequestParam(required = false) String price,
								@RequestParam(required = false) String minPrice,
								@RequestParam(required = false) String additionalInfo) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		
		map.put("goodsId",goodsId);
		map.put("name", name);
		if(best.equals("on")) {
			map.put("best", 1);
		}else {
			map.put("best", 2);
		}
		map.put("price",price);
		map.put("minPrice",minPrice);
		map.put("additionalInfo",additionalInfo);
		
		//가격표 수정 
		mypageService.updateGoodsInfo(map);
		
		attr.addAttribute("shopIdx",shopIdx);
		
		return "redirect:/front/mypage/shop";
		
	}
	
	//프로필 수정 이동
	@GetMapping("/front/member/member_update")
	public String memberUpdate() {
		
		return "front/member/member_update";
	}
	
	@PostMapping("/front/member/member_update_pro")
	public String memberUpdatePro(@ModelAttribute MemberUpdateBean memberUpdateBean) {
		
		//나중에 로그인 객체 받아오면 수정해주기 ★★
		memberUpdateBean.setMemberId(1);
		
		//update 쿼리 실행하기 
		memberService.frontMemberInfoUpdate(memberUpdateBean);
		
		return "redirect:/front/member/myPage";
	}	
	
	//단골 페이지 이동
	@RequestMapping("/front/mypage/bookmark")
	public String bookmark(Model model) {
		
		// 단골 페이지 list
		// 나중에 로그인 객체에서 값 받아와서 파라미터로 넘겨주기★★
		List<HashMap<Object,Object>> bookmartList = mypageService.getFrontBookmarkShop(1);
		model.addAttribute("bookmartList",bookmartList);
		
		HashMap<Object,Object> checkMap = new HashMap<Object,Object>();

		return "front/mypage/bookmark";
	}
	
	//가게 후기 페이지 이동
	@RequestMapping("/front/mypage/my_review")
	public String shopReview(Model model) {
		
		//후기 페이지 list
		//나중에 로그인 객체에서 값 받아와서 파라미터로 넘겨주기★★
		List<HashMap<Object,Object>> reviewList = mypageService.getFrontReviewShop(1);
		model.addAttribute("reviewList",reviewList);
		
		
		return "front/mypage/my_review";
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
	@RequestMapping("/front/mypage/question_account")
	public String myQuestion(Model model) {
		
		//나의 문의 페이지 list
		//나중에 로그인 객체에서 값 받아와서 파라미터로 넘겨주기★★
		List<HashMap<Object,Object>> questionList = mypageService.getFrontMemberQuestion(1);
		model.addAttribute("questionList",questionList);
		
		
		return "front/mypage/question_account";
		
	}
	
	//자주묻는 질문 카테고리 페이지 이동 
	@RequestMapping("/front/mypage/frequent_question_category")
	public String frequentQuestionCategory(Model model) {
		
		//자주묻는 질문 카테고리 리스트
		//하위 카테고리는 클릭할때마다 ajax로 받아오기(그건 아직 안함..)
		List<HashMap<Object,Object>> categoryList = mypageService.getFrontFrequentQuestionCategory();
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
	
	//회원 탈퇴 페이지 이동
	@RequestMapping("/front/mypage/withdrawal")
	public String withdrawal(Model model) {
		
		//맴버 닉네임(나중에 맴버객체값으로 대체)
		model.addAttribute("name","다파는남자");
		
		model.addAttribute("cateList",mypageService.getWithCategory());
		
		return "front/mypage/withdrawal";
		
	}
	
	//회원 탈퇴 완료 
	@RequestMapping("/front/mypage/withdrawal_pro")
	public String withdrawalPro(@RequestParam HashMap<Object,Object> map) {
		
		//나중에 멤버 객체에서 값꺼내서 넣어주기..★★
		map.put("memberId",1);
		
		//회원 탈퇴 처리
		mypageService.memberWithDraw(map);
		
		return "front/mypage/withdrawal_pro";
		
	}
	
	// 회원 가게신청 썸네일 페이지 이동
	@GetMapping("/front/mypage/member_shop_apply_thumbnail")
	public String memberShopApplyThumbnail() {

		return "front/mypage/shop_apply_thumbnail";
		
	}

	// 가게 신청 페이지 이동
	@GetMapping("/front/mypage/shop_apply")
	public String shopApply(Model model) {
		
		//업종 정보
		List<HashMap<Object,Object>> secList = accountManageService.getSectorList();
		model.addAttribute("secList",secList);
		
		//지역정보
		//나중에 받은 우편번호로 대체해주기 ★★
		List<HashMap<Object,Object>> areaList = mypageService.getAreaList("01");
		model.addAttribute("areaList",areaList);
		
		return "front/mypage/shop_apply";
		
	}

	// 가게 신청
	@PostMapping("/front/mypage/shop_apply_pro")
	public String shopApplyPro(@ModelAttribute ShopRegisterBean shopRegisterBean, Model model) {

		// 나중에 맴버 객체에 있는 값으로 대체하기 ★★
		shopRegisterBean.setMemberId(1);
		// 나중에 가맹점 번호 같이 넣어주기 ★★
		shopRegisterBean.setFranchiseId(1);
		// 나중에 위도,경도 값 받으면 지우기 ★★
		shopRegisterBean.setLatitude("la");
		shopRegisterBean.setLongitude("lo");

		shopService.addFrontShop(shopRegisterBean);
		model.addAttribute("shopName", shopRegisterBean.getShopName());

		return "redirect:/front/myPage";

	}
	
	//가게 프로필 수정 
	@RequestMapping("/front/mypage/profile_update")
	public String profileUpdate(@RequestParam int shopIdx,
								Model model) {
		
		//프로필 정보 
		HashMap<Object,Object> map = mypageService.getProInfo(shopIdx);
		model.addAttribute("map",map);
		
		//이미지 정보
		List<String> imgList = mypageService.getProImg(shopIdx);
		model.addAttribute("imgList",imgList);
		
		//키워드 정보
		List<String> keyList = mypageService.getProKeyword(shopIdx);
		model.addAttribute("keyList",keyList);
		
		//지역 정보
		List<HashMap<Object,Object>> areaList = mypageService.getAreaList("01");
		model.addAttribute("areaList",areaList);
		
		model.addAttribute("shopIdx",shopIdx);
		
		
		return "front/mypage/profile_update";
		
	}
	
	//가게 프로필 수정 진행
	@RequestMapping("/front/mypage/profile_update_pro")
	public String profileUpdatePro(@ModelAttribute ProfileUpdateBean bean,
									RedirectAttributes attr) {
		
		
		attr.addAttribute("shopIdx",bean.getShopIdx());
		
		//프로필 수정 
		mypageService.updateShopProfile(bean);
		
		return "redirect:/front/mypage/shop";
	}
	
	//나의 가게 단골 페이지
	@RequestMapping("/front/mypage/shop_bookmark")
	public String shopBookMark(@RequestParam int shopIdx,
								Model model) {
		
		//단골 리스트
		List<HashMap<Object,Object>> list = mypageService.getShopBookmark(shopIdx);
		model.addAttribute("list",list);
		
		//단골 회원수 
		int cnt = mypageService.getShopBookmarkCnt(shopIdx);
		model.addAttribute("cnt",cnt);
		
		return "front/mypage/shop_bookmark";
	}
	
	//소식 요약 페이지 이동
	@RequestMapping("/front/mypage/news_summ")
	public String newsSumm(@RequestParam int shopIdx,
							Model model) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("shopIdx",shopIdx);
		//나중에 로그인 객체에서 값 대체해주기 ★★
		map.put("memberId",1);
		
		//가게 소식 
		List<HashMap<Object,Object>> list = shopService.getNewsList(map);
		model.addAttribute("list",list);
		
		model.addAttribute("shopIdx",shopIdx);
		
		return "front/mypage/news_summ";
	}
		
	//관리자 소식 페이지 이동
	@RequestMapping("/front/mypage/shop_news")
	public String shopNews(@RequestParam int shopIdx,
							Model model) {
		
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("shopIdx",shopIdx);
		//나중에 로그인 객체에서 값 대체해주기 ★★
		map.put("memberId",1);
		
		//가게 소식 
		List<HashMap<Object,Object>> list = shopService.getNewsList(map);
		model.addAttribute("list",list);
		
		//가게 정보 
		HashMap<Object,Object> shopMap = shopService.getFrontShopDetail(shopIdx);
		model.addAttribute("shopMap",shopMap);
		
		model.addAttribute("shopIdx",shopIdx);
		
//		HashMap<Object, Object> checkMap = new HashMap<Object, Object>();
//		checkMap.put("shopIdx", shopIdx);
//		// 나중에는 member 객체에 담긴 정보 넣어주기 ★★
//		checkMap.put("memberId", 1);
//
//		// 가게 단골 체크 : 1은 단골아님 2는 단골
//		if (shopService.checkFrontShopMember(checkMap) == null) {
//			model.addAttribute("checkNum", 1);
//		} else {
//			model.addAttribute("checkNum", 2);
//		}
//
//		//본인 가게인지 확인 
//		int shopChk = mypageService.chkMemShop(checkMap);
//		model.addAttribute("shopChk",shopChk);
//		model.addAttribute("shopChk",2);
//		
//		// 단골가게 회원 수
//		int bookmarkCnt = shopService.getBookmarkShopCnt(shopIdx);
//		model.addAttribute("bookmarkCnt", bookmarkCnt);
		
		
		return "front/mypage/shop_news";
	}
	
	//가게 소식 상세페이지 이동
	@RequestMapping("/front/mypage/news_detail")
	public String newsDetail(@RequestParam int shopNewsId,
							@RequestParam int shopIdx,
							Model model) {
		
		HashMap<Object,Object> paramMap = new HashMap<Object,Object>();
		paramMap.put("shopNewsId",shopNewsId);
		//나중에 수정해주기 ★★
		paramMap.put("memberId",1);
		
		//가게 정보 
		HashMap<Object,Object> shopMap = shopService.getFrontShopDetail(shopIdx);
		model.addAttribute("shopMap",shopMap);
		
		//소식 디테일 정보
		HashMap<Object,Object> map = shopService.getNewsDetailInfo(paramMap);
		model.addAttribute("map",map);
		
		return "front/mypage/news_detail";
	}
	
	//소식 작성 페이지 이동
	@RequestMapping("/front/mypage/news_regi")
	public String newsRegi(@RequestParam int shopIdx,
							Model model) {
		
		//가게 정보 
		HashMap<Object,Object> map = shopService.getFrontShopDetail(shopIdx);
		model.addAttribute("map",map);
		
		//소식글 카테고리 얻어오기
		List<HashMap<Object,Object>> list = mypageService.getNewsCate();
		model.addAttribute("list",list);
		
		return "front/mypage/news_regi";
	}
	
	//소식 작성 
	@RequestMapping("/front/mypage/news_regi_pro")
	public String newsRegiPro(@RequestParam int cateId,
							@RequestParam String title,
							@RequestParam String content,
							@RequestParam int shopIdx,
							@RequestParam List<MultipartFile> uploadFile,
							RedirectAttributes attr) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("shopNewsCategoryId",cateId);
		map.put("title",title);
		map.put("content",content);
		map.put("shopIdx",shopIdx);
			
		mypageService.addShopNews(map, uploadFile);
		
		attr.addAttribute("shopIdx",shopIdx);
		
		return "redirect:/front/mypage/shop";
		
		
	}
	
	// 후기 페이지 이동
	@RequestMapping("/front/mypage/shop_review")
	public String shopReview(@RequestParam int shopIdx,
							Model model) {
		
		//가게 정보 
		HashMap<Object,Object> map = shopService.getFrontShopDetail(shopIdx);
		model.addAttribute("map",map);
		
		//후기 정보
		List<HashMap<Object,Object>> list = mypageService.getReviewList(shopIdx);
		model.addAttribute("list",list);
		
		model.addAttribute("shopIdx",shopIdx);
		
		
		return "front/mypage/shop_review";
	}
	
	//후기 댓글 등록 (사장)
	@RequestMapping("/front/mypage/review_reply")
	public String reviewReply(@RequestParam int shopReviewId,
							@RequestParam String reply,
							@RequestParam int shopIdx,
							RedirectAttributes attr) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("shopReviewId", shopReviewId);
		map.put("reply",reply);
		
		attr.addAttribute("shopIdx", shopIdx);
		
		mypageService.reviewReply(map);
		
		return "redirect:/front/mypage/shop_review";
	}
	
	
}
