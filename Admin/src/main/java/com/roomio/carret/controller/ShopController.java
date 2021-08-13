package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.roomio.carret.bean.LoginManagerBean;
import com.roomio.carret.bean.LoginMemberBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.ShopApplySearchBean;
import com.roomio.carret.bean.ShopCurationBean;
import com.roomio.carret.bean.ShopRegisterBean;
import com.roomio.carret.bean.ShopSearchBean;
import com.roomio.carret.service.MypageService;
import com.roomio.carret.service.ShopService;

@Controller
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	@Autowired
	private MypageService mypageService;
	
	@Resource(name = "loginMemberBean")
	@Lazy
	private LoginMemberBean loginMemberBean;

	Logger logger = LoggerFactory.getLogger(ShopController.class);

	@GetMapping("/shop/list")
	public String goShopList(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			@ModelAttribute ShopSearchBean shopSearchBean) {

		// 가맹점 명
		List<HashMap<Object, Object>> franchiseNameList = shopService.getFranchiseName();
		model.addAttribute("franchiseNameList", franchiseNameList);

		// 왜 공백 생기는지 모르겟음..
		if (shopSearchBean.getKeyword() != null) {
			shopSearchBean.setKeyword(shopSearchBean.getKeyword().trim());
		}

		// 지역명
//		List<HashMap<Object,Object>> areaList = shopService.getAreaList();
//		model.addAttribute("areaList",areaList);
//		
//		if(shopSearchBean.getBaseArea() == 00) {
//			//경기도 지역의 세부지역정보
//			List<HashMap<Object,Object>> areaSigunguDefaultList = shopService.getAreaSigunguDefault();
//			model.addAttribute("areaSigunguDefaultList",areaSigunguDefaultList);
//		}else {
//			
//			//타 지역 세부지역 정보 
//			List<HashMap<Object,Object>> areaSigunguDefaultList = shopService.getAreaSigunguList(shopSearchBean.getBaseArea());
//			model.addAttribute("areaSigunguDefaultList",areaSigunguDefaultList);
//			
//		}

		// 가게 리스트
		List<HashMap<Object, Object>> shopList = shopService.getShopList(page, shopSearchBean);
		model.addAttribute("shopList", shopList);

		// 총 리스트 갯수
		int shopListCnt = shopService.getShopRealCnt(shopSearchBean);
		model.addAttribute("shopListCnt", shopListCnt);

		// 페이징 처리 빈
		PageBean pageBean = shopService.getShopCnt(page, shopSearchBean);
		model.addAttribute("pageBean", pageBean);

		return "shop/shop_list";
	}

	@GetMapping("/shop/apply")
	public String shopApply(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			@ModelAttribute ShopApplySearchBean shopApplySearchBean) {

		// 가맹점 명
		List<HashMap<Object, Object>> franchiseNameList = shopService.getFranchiseName();
		model.addAttribute("franchiseNameList", franchiseNameList);

		// 지역명
		List<HashMap<Object, Object>> areaList = shopService.getAreaList();
		model.addAttribute("areaList", areaList);

		if (shopApplySearchBean.getBaseArea() == 00) {
			// 경기도 지역의 세부지역정보
			List<HashMap<Object, Object>> areaSigunguDefaultList = shopService.getAreaSigunguDefault();
			model.addAttribute("areaSigunguDefaultList", areaSigunguDefaultList);
		} else {
			// 타 지역 세부지역 정보
			List<HashMap<Object, Object>> areaSigunguDefaultList = shopService
					.getAreaSigunguList(shopApplySearchBean.getBaseArea());
			model.addAttribute("areaSigunguDefaultList", areaSigunguDefaultList);
		}

		// 가게 신청 리스트
		List<HashMap<Object, Object>> shopApplyList = shopService.getShopApplyList(page, shopApplySearchBean);
		model.addAttribute("shopApplyList", shopApplyList);

		// 페이지 처리 빈
		PageBean pageBean = shopService.getShopApplyCnt(page, shopApplySearchBean);
		model.addAttribute("pageBean", pageBean);

		return "shop/apply_shop";

	}

	@PostMapping("/shop/apply_pro")
	public String applyPro(@RequestParam(required = false) String responsibilityMemo, @RequestParam String shopCode,
			@RequestParam(required = false) String returnReason, @RequestParam(required = false) String ok,
			@RequestParam(required = false) String no, @RequestParam(required = false) String keep,
			@RequestParam int shopIdx) {
		HashMap<Object, Object> applyInfoMap = new HashMap<Object, Object>();

		applyInfoMap.put("responsibilityMemo", responsibilityMemo);
		applyInfoMap.put("shopCode", shopCode);
		applyInfoMap.put("returnReason", returnReason);
		applyInfoMap.put("ok", ok);
		applyInfoMap.put("no", no);
		applyInfoMap.put("keep", keep);
		// map에 값 담기
		applyInfoMap.put("shopIdx", shopIdx);

		shopService.updateShopApplyInfo(applyInfoMap);

		return "shop/apply_shop_success";
	}

	@GetMapping("/shop/image_pop_up")
	public String imagePopUp(@RequestParam int shopIdx, Model model) {
		model.addAttribute("shopIdx", shopIdx);
		return "shop/image_pop_up";

	}

	// 가게 메인페이지 이동
	@GetMapping("/front/shop/shop_promotion")
	public String shopPromotion(Model model) {

		// 가맹점 코드넣어주기 파라미터로 ★★
		List<ShopCurationBean> curationList = shopService.getFrontShopPromotion(1);
		model.addAttribute("curationList", curationList);
		
		//지역정보
		//나중에 받은 우편번호로 대체해주기 ★★
		List<HashMap<Object,Object>> areaList = mypageService.getAreaList("325");
		model.addAttribute("areaList",areaList);

		return "front/shop/shop_promotion";
	}

	// 가게 상세정보 페이지 이동
	@GetMapping("/front/shop/shop_detail")
	public String shopDetail(@RequestParam(value = "shopIdx", required = false) int shopIdx, Model model,
			@RequestParam(required = false, defaultValue = "latest") String sort) {

		// 가게 상세정보
		HashMap<Object, Object> detailMap = shopService.getFrontShopDetail(shopIdx);
		model.addAttribute("detailMap", detailMap);

		// 가게 상품정보
		List<HashMap<Object, Object>> goodsList = shopService.getFrontShopGoods(shopIdx);
		model.addAttribute("goodsList", goodsList);

		HashMap<Object, Object> reviewMap = new HashMap<Object, Object>();
		reviewMap.put("shopIdx", shopIdx);
		reviewMap.put("sort", sort);

		// 가게 리뷰
		List<HashMap<Object, Object>> reviewList = shopService.getFrontShopReviews(reviewMap);
		model.addAttribute("reviewList", reviewList);

		// 가게 소식
		List<HashMap<Object, Object>> newsList = shopService.getFrontShopNews(shopIdx);
		model.addAttribute("newsList", newsList);

		HashMap<Object, Object> checkMap = new HashMap<Object, Object>();
		checkMap.put("shopIdx", shopIdx);
		// 나중에는 member 객체에 담긴 정보 넣어주기 ★★
		checkMap.put("memberId", 1);

		// 가게 단골 체크 : 1은 단골아님 2는 단골
		if (shopService.checkFrontShopMember(checkMap) == null) {
			model.addAttribute("checkNum", 1);
		} else {
			model.addAttribute("checkNum", 2);
		}

		// 단골가게 회원 수
		int bookmarkCnt = shopService.getBookmarkShopCnt(shopIdx);
		model.addAttribute("bookmarkCnt", bookmarkCnt);

		model.addAttribute("sort", sort);

		return "front/shop/shop_detail";

	}

	
	
	// 가게 소식 페이지 이동
	@GetMapping("/front/shop/shop_news2")
	public String shopNews2(@RequestParam("shopIdx") String shopIdx, Model model) {

		// 가게 정보
		HashMap<Object, Object> detailMap = shopService.getFrontShopDetail(Integer.parseInt(shopIdx));
		model.addAttribute("detailMap", detailMap);
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("shopIdx",Integer.parseInt(shopIdx));
		//나중에 로그인 객체에서 값 대체해주기 ★★
		map.put("memberId",1);

		// 가게 소식
		List<HashMap<Object, Object>> list = shopService.getNewsList(map);
		model.addAttribute("list", list);

		//가게 단골 체크 : 1은 단골아님 2는 단골 
		if(shopService.checkFrontShopMember(map) == null) {
			model.addAttribute("checkNum",1);
		}else {
			model.addAttribute("checkNum",2);
		}
		
		//단골가게 회원 수 
		int bookmarkCnt = shopService.getBookmarkShopCnt(Integer.parseInt(shopIdx));
		model.addAttribute("bookmarkCnt",bookmarkCnt);

		return "front/shop/shop_news2";
	}


	// 가게 소식 상세 페이지
	@GetMapping("/front/shop/shop_news_extend2")
	public String shopNewsExtend2(@RequestParam("shopNewsId") String shopNewsId,
			@RequestParam("shopIdx") String shopIdx, Model model) {

		// 가게 정보
		HashMap<Object, Object> detailMap = shopService.getFrontShopDetail(Integer.parseInt(shopIdx));
		model.addAttribute("detailMap", detailMap);
		
		HashMap<Object,Object> paramMap = new HashMap<Object,Object>();
		paramMap.put("shopNewsId",Integer.parseInt(shopNewsId));
		//나중에 수정해주기 ★★
		paramMap.put("memberId",1);
		
		// 디테일 정보
		HashMap<Object, Object> map = shopService.getNewsDetailInfo(paramMap);
		model.addAttribute("map", map);

		HashMap<Object, Object> checkMap = new HashMap<Object, Object>();
		checkMap.put("shopIdx", shopIdx);
		// 나중에는 member 객체에 담긴 정보 넣어주기 ★★
		checkMap.put("memberId", 1);

		// 가게 단골 체크 : 1은 단골아님 2는 단골
		if (shopService.checkFrontShopMember(checkMap) == null) {
			model.addAttribute("checkNum", 1);
		} else {
			model.addAttribute("checkNum", 2);
		}

		// 단골가게 회원 수
		int bookmarkCnt = shopService.getBookmarkShopCnt(Integer.parseInt(shopIdx));
		model.addAttribute("bookmarkCnt", bookmarkCnt);

		return "front/shop/shop_news_extend2";
	}
	
	@GetMapping("/front/shop/shop_review2")
	public String shopReview2(@RequestParam("shopIdx") String shopIdx, Model model,
			@RequestParam(required = false, defaultValue = "latest") String sort) {

		// 가게 정보
		HashMap<Object, Object> detailMap = shopService.getFrontShopDetail(Integer.parseInt(shopIdx));
		model.addAttribute("detailMap", detailMap);
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("shopIdx",Integer.parseInt(shopIdx));
		map.put("memberId",loginMemberBean.getMember_id());
		map.put("sort",sort);

		//후기 정보
		List<HashMap<Object,Object>> list = mypageService.getReviewList(map);
		model.addAttribute("list",list);

		HashMap<Object, Object> checkMap = new HashMap<Object, Object>();
		checkMap.put("shopIdx", shopIdx);
		// 나중에는 member 객체에 담긴 정보 넣어주기 ★★
		checkMap.put("memberId", 1);

		// 가게 단골 체크 : 1은 단골아님 2는 단골
		if (shopService.checkFrontShopMember(checkMap) == null) {
			model.addAttribute("checkNum", 1);
		} else {
			model.addAttribute("checkNum", 2);
		}

		// 가게 후기 갯수
		int reviewCnt = shopService.getFrontShopReviewCnt(Integer.parseInt(shopIdx));
		model.addAttribute("reviewCnt", reviewCnt);

		// 단골가게 회원 수
		int bookmarkCnt = shopService.getBookmarkShopCnt(Integer.parseInt(shopIdx));
		model.addAttribute("bookmarkCnt", bookmarkCnt);

		model.addAttribute("sort", sort);

		return "front/shop/shop_review2";

	}
	
	@GetMapping("/front/shop/review_detail")
	public String reviewDetail(@RequestParam int shopReviewId,
							Model model) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("shopReviewId",shopReviewId);
		map.put("memberId",loginMemberBean.getMember_id());
		
		HashMap<Object,Object> reMap = mypageService.getReviewDetail(map);
		model.addAttribute("reMap",reMap);
		
		return "front/shop/review_detail";
	}

	// 리뷰 페이지 이동
	@GetMapping("/front/shop/shop_review_register")
	public String shopReviewRegi(@RequestParam String shopIdx, Model model) {

		model.addAttribute("shopIdx", shopIdx);

		List<HashMap<Object, Object>> categoryList = shopService.getFrontReviewCategory();
		model.addAttribute("categoryList", categoryList);

		return "front/shop/shop_review_register";

	}

	// 리뷰 페이지 이동
	@GetMapping("/front/shop/shop_review_register2")
	public String shopReviewRegi2(@RequestParam String shopIdx, Model model) {

		model.addAttribute("shopIdx", shopIdx);

		List<HashMap<Object, Object>> categoryList = shopService.getFrontReviewCategory();
		model.addAttribute("categoryList", categoryList);

		return "front/shop/shop_review_register2";

	}

	// 리뷰 페이지 등록
	@RequestMapping(value = "/front/shop/shop_review_register_pro", method = { RequestMethod.GET, RequestMethod.POST })
	public String shopReviewRegiPro(@RequestParam(required = false) String[] reviewKeywordCategoryId,
			@RequestParam(value = "reviewImg", required = false) List<MultipartFile> file, @RequestParam String content,
			@RequestParam String shopIdx) {

		HashMap<Object, Object> map = new HashMap<Object, Object>();

		// 나중에는 맴버 객체 세션에 담아두고 꺼내서 사용하는것으로 수정 ..★★
		map.put("shopIdx", Integer.parseInt(shopIdx));
		map.put("memberId", loginMemberBean.getMember_id());
		map.put("content", content);

		if (file == null) {
			System.out.println("file이 null 입니당...");
		}

		shopService.addShopReview(map, reviewKeywordCategoryId, file);

		return "front/shop/shop_review_register_pro";

	}

	// 추천 검색어 페이지 이동
	@GetMapping("/front/shop/shop_recomm_search")
	public String shopRecommSearch(@RequestParam("recomm") String recomm, Model model) {
		model.addAttribute("recomm", recomm);
		return "front/shop/shop_recomm_search";

	}

	// 지역 검색 페이지 이동
	@GetMapping("/front/shop/shop_area_search")
	public String shopAreaSearch() {

		return "front/shop/shop_area_search";
		
	}

	// 큐레이션 페이지 이동
	@GetMapping("/front/shop/shop_curation_search")
	public String shopCurationSearch(@RequestParam("search") String search, Model model) {
		model.addAttribute("search", search);
		return "front/shop/shop_curation_search";

	}

	// 가게 신고 카테고리 페이지 이동
	@GetMapping("/front/shop/shop_report_category")
	public String shopReportCategory(@RequestParam String status, @RequestParam int shopIdx, Model model) {

		// 카테고리 정보 얻어오기
		List<HashMap<Object, Object>> categoryList = shopService.getFrontReportCategory();

		model.addAttribute("status", status);
		model.addAttribute("shopIdx", shopIdx);
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("image",loginMemberBean.getMain_image());
		model.addAttribute("name",loginMemberBean.getName());
		model.addAttribute("areaName",loginMemberBean.getArea_name());
		

		return "front/shop/shop_report_category";
	}

	// 가게신고 상세 페이지 이동
	@GetMapping("/front/shop/shop_report")
	public String shopReport(@RequestParam String status, Model model, @RequestParam int reportCategoryId,
			@RequestParam int shopIdx) {

		model.addAttribute("status", status);
		model.addAttribute("reportCategoryId", reportCategoryId);
		model.addAttribute("shopIdx", shopIdx);

		// 가게 상세정보
		HashMap<Object, Object> detailMap = shopService.getFrontShopDetail(shopIdx);
		model.addAttribute("detailMap", detailMap);

		return "front/shop/shop_report";
	}

	// 신고 성공
	@RequestMapping("/front/shop/shop_report_success")
	public String shopReportSuccess(@RequestParam String status, Model model, @RequestParam int reportCategoryId,
			@RequestParam int shopIdx, @RequestParam(required = false) String content, @RequestParam String shopName) {

		HashMap<Object, Object> map = new HashMap<Object, Object>();

		// 나중에 가맹점 객체 받아서 값 교체해주기★★
		map.put("franchiseId", 1);

		// 나중에 로그인 객체 받아서 값 교체해주기 ★★
		map.put("memberId", 1);
		map.put("shopName", shopName);
		map.put("reportCategoryId", reportCategoryId);
		map.put("shopIdx", shopIdx);
		map.put("content", content);

		// 신고 등록
		shopService.addShopReport(map);

		return "front/shop/shop_report_success";
	}

	// 단골 등록
	@GetMapping("/front/shop/shop_bookmark")
	public String shopBookmark(@RequestParam("shopIdx") int shopIdx, @RequestParam(required = false) String shopNewsId,
			Model model, @RequestParam String nowPage, RedirectAttributes attr) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("shopIdx", shopIdx);

		// 나중에 로그인객체 정해지면 값 수정하기 ★★
		map.put("memberId", 1);

		// 단골 추가
		shopService.addBookmarkShop(map);

		attr.addAttribute("shopIdx", shopIdx);

		if (nowPage.equals("detail")) {
			return "redirect:/front/shop/shop_detail";
		} else if (nowPage.equals("news")) {
			attr.addAttribute("shopNewsId", Integer.parseInt(shopNewsId));
			return "redirect:/front/shop/shop_news_extend2";
		} else if (nowPage.equals("mypage")) {
			return "redirect:/front/mypage/bookmark";
		} else {
			return "redirect:/front/shop/shop_review2";
		}
	}

	// 단골 해제
	@GetMapping("/front/shop/shop_bookmark_cancel")
	public String shopBookmarkCancel(@RequestParam("shopIdx") int shopIdx,
			@RequestParam(required = false) String shopNewsId, Model model, @RequestParam String nowPage,
			RedirectAttributes attr) {

		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("shopIdx", shopIdx);
		// 나중에 로그인객체 정해지면 값 수정하기 ★★
		map.put("memberId", 1);

		// 단골 해제
		shopService.deleteBookmarkShop(map);

		attr.addAttribute("shopIdx", shopIdx);

		if (nowPage.equals("detail")) {
			return "redirect:/front/shop/shop_detail";
		} else if (nowPage.equals("news")) {
			attr.addAttribute("shopNewsId", Integer.parseInt(shopNewsId));
			return "redirect:/front/shop/shop_news_extend2";
		} else if (nowPage.equals("mypage")) {
			return "redirect:/front/mypage/bookmark";
		} else {
			return "redirect:/front/shop/shop_review2";
		}

	}

	

	// 가게 홍보페이지 (지역)
	@GetMapping("/front/shop/shop_promotion_area")
	public String shopPromotionArea(@RequestParam(required = false, defaultValue = "999") int area, Model model) {

		//지역정보
		//나중에 받은 우편번호로 대체해주기 ★★
		List<HashMap<Object,Object>> areaList = mypageService.getAreaList("325");
		model.addAttribute("areaList",areaList);
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();

		// 나중에 가맹점 값 넣어주기 ★★
		map.put("franchiseId", 1);
		map.put("page", 0);
		map.put("area", area);

		// 지역별 가게정보
		List<HashMap<Object, Object>> shopList = shopService.getFrontShopPromotionArea(map);
		model.addAttribute("shopList", shopList);

		model.addAttribute("area", area);

		return "front/shop/shop_promotion_area";
	}

	// 가게 홍보페이지(기획전)
	@GetMapping("/front/shop/shop_promotion_curation")
	public String shopPromotionCuration(@RequestParam int exhiId, Model model) {

		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("exhiId", exhiId);
		// 나중에 가맹점 값 넣어주기 ★★
		map.put("franchiseId", 1);
		map.put("page", 0);

		// 배너이미지 정보
		HashMap<Object, Object> exhiInfo = shopService.getFrontCurationBannerImage(exhiId);
		model.addAttribute("exhiInfo", exhiInfo);

		// 큐레이션 가게 정보
		List<HashMap<Object, Object>> curationShopList = shopService.getFrontShopPromotionCuration(map);
		model.addAttribute("curationShopList", curationShopList);

		model.addAttribute("exhiId", exhiId);

		return "front/shop/shop_promotion_curation";
	}

}
