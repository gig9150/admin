package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roomio.carret.bean.FranchiseRegisterBean;
import com.roomio.carret.bean.LoginMemberBean;
import com.roomio.carret.service.ExhibitionService;
import com.roomio.carret.service.ManagerAccountService;
import com.roomio.carret.service.ManagerService;
import com.roomio.carret.service.MemberService;
import com.roomio.carret.service.MypageService;
import com.roomio.carret.service.ShopService;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	private ManagerAccountService managerAccountService;
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private ExhibitionService exhibitionService;
	
	@Autowired
	private MypageService mypageService;
	
	@Resource(name = "loginMemberBean")
	@Lazy
	private LoginMemberBean loginMemberBean;

	//매니저 아이디 중복체크 
	@GetMapping("/manager/idExistCheck/{id}")
	public String idExistCheck(@PathVariable String id) {
		
		boolean chk = managerAccountService.idExistCheck(id);
		
		return chk + "";
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
	
	//프론트 소식 댓글 insert
	@GetMapping("/front/shop/newsinsertComment/{shopNewsId}/{comment}")
	public String newsInsertComment(@PathVariable int shopNewsId,
									@PathVariable String comment) {
		
		// 나중에 이런식으로 로그인 객체에서 값뽑아서 insert 해주기
//		int member_id = loginMemberBean.getMember_id();
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		
		map.put("memberId",1);
		map.put("shopNewsId",shopNewsId);
		map.put("content",comment);
		
		shopService.addShopNewsComment(map);
		
		return "";
	}
	
	//닉네임 중복 체크
	@GetMapping("/front/member/checkName/{name}")
	public String checkName(@PathVariable String name) {
		
		boolean chk = memberService.frontMemberNameChk(name);
		
		return chk + "";
	}
	
	//전에 사용하던 닉네임 가져오기 
	@GetMapping("/front/member/GetMemberName/{updateName}")
	public String GetMemberName(@PathVariable String updateName) {
		
		String name = memberService.frontGetMemberName(updateName);
		return name;
		
	}
	
	//가게 홍보 지역 정보 얻어오기
	@GetMapping("/front/shop/shopPromotionArea/{page}/{area}")
	public List<HashMap<Object,Object>> ShopPromotionArea(@PathVariable int page,
									@PathVariable int area) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("page",page);
		map.put("area",area);
		//나중에 가맹점 값 넣어주기 ★★
		map.put("franchiseId", 1);
		
		List<HashMap<Object,Object>> shopList = shopService.getFrontShopPromotionArea(map);

		return shopList;
	}
	
	//가게 홍보 큐레이션 정보 얻어오기
	@GetMapping("/front/shop/shopPromotionCuration/{page}/{exhiId}")
	public List<HashMap<Object,Object>> ShopPromotionCuration(@PathVariable int page,
															@PathVariable int exhiId) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("page",page);
		map.put("exhiId",exhiId);
		//나중에 가맹점 값 넣어주기 ★★
		map.put("franchiseId", 1);
		
		List<HashMap<Object,Object>> curationShopList = shopService.getFrontShopPromotionCuration(map);

		return curationShopList;
	}
	
	//url 중복 체크${root}/exhibition/urlCheck/'+url
	@GetMapping("/exhibition/urlCheck/{url}")
	public String urlCheck(@PathVariable String url,
							Model model) {
		
		boolean urlCheck = exhibitionService.checkUrlExist(url);
		model.addAttribute("test","test");
		
		return urlCheck + "";
	}
	
	@GetMapping("/manager/managerNoticeFranchise/{managerNoticeId}")
	public List<Integer> managerNoticeFranchise(@PathVariable int managerNoticeId){
		
		List<Integer> list = managerService.getManagerNoticeFran(managerNoticeId);
		return list;
	}
	
	//자주묻는 질문 질문내용 얻어오기
	@GetMapping("/front/mypage/getFreTitle/{id}")
	public List<HashMap<Object,Object>> getFreTitle(@PathVariable int id){
		
		List<HashMap<Object,Object>> list = mypageService.getFrontFreTitle(id);
		return list;
		
	}
	
	//가게이름 중복 체크
	@RequestMapping("/front/mypage/chkShopName/{shopName}")
	public String chkShopName(@PathVariable String shopName) {
		
		boolean chk = mypageService.checkShopName(shopName);
		
		return chk + "";
		
	}
	
	//가게 소식 좋아요 추가 
	@RequestMapping("/front/shop/newsLikeAdd/{shopNewsId}")
	public String newsLikeAdd(@PathVariable int shopNewsId) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("shopNewsId",shopNewsId);
		
		//나중에 수정해주기 ★★
		map.put("memberId",1);
		
		int num = shopService.addNewsLike(map);
		
		if(num >= 1) {
			return "success";
		}else {
			return "fail";			
		}
	}
	
	//가게 소식 좋아요 삭제
	@RequestMapping("/front/shop/newsLikeDel/{shopNewsId}")
	public String newsLikeDel(@PathVariable int shopNewsId) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("shopNewsId",shopNewsId);
		
		//나중에 수정해주기 ★★
		map.put("memberId",1);
		
		int num = shopService.delNewsLike(map);
		
		if(num >= 1) {
			return "success";
		}else {
			return "fail";
		}
	}

	
	
	
}
