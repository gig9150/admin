package com.roomio.carret.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.roomio.carret.bean.MemberRegisterBean;
import com.roomio.carret.bean.ProfileUpdateBean;
import com.roomio.carret.bean.ShopInfoUpdateBean;
import com.roomio.carret.dao.MypageDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class MypageService {

	@Value("${path.upload}")
	private String pathUpload;

	@Autowired
	private MypageDao mypageDao;

	private String saveUploadFile(MultipartFile upload_file) {

		String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();

		try {
			upload_file.transferTo(new File(pathUpload + file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return file_name;
	}

	public List<HashMap<Object, Object>> getFrontBookmarkShop(int memberId) {
		return mypageDao.getFrontBookmarkShop(memberId);
	}

	public List<HashMap<Object, Object>> getFrontReviewShop(int memberId) {
		return mypageDao.getFrontReviewShop(memberId);
	}

	public List<HashMap<Object, Object>> getFrontMemberQuestion(int memberId) {
		return mypageDao.getFrontMemberQuestion(memberId);
	}

	public List<HashMap<Object,Object>> getFrontFrequentQuestionCategory() {
		return mypageDao.getFrontFrequentQuestionCategory();
	}

	public HashMap<Object, Object> getFrontFrequentQuestion(int frequentQuestionId) {
		return mypageDao.getFrontFrequentQuestion(frequentQuestionId);
	}

	public List<HashMap<Object, Object>> getFrontNotice() {
		return mypageDao.getFrontNotice();
	}

	public HashMap<Object, Object> getFrontNoticeDetail(int noticeId) {
		return mypageDao.getFrontNoticeDetail(noticeId);
	}

	public HashMap<Object, Object> getFrontQuestionMemberInfo(int memberId) {
		return mypageDao.getFrontQuestionMemberInfo(memberId);
	}
	
	public List<HashMap<Object,Object>> getFrontQuestionCategory(){
		return mypageDao.getFrontQuestionCategory();
	}

	public void addFrontMemberQuestion(HashMap<Object, Object> questionMap,List<MultipartFile> file) {
		
		// 문의 등록
		mypageDao.addFrontMemberQuestion(questionMap);
		
		// 가장 최근 insert된 문의 키값 얻어오기
		int questionId =  (int)questionMap.get("memberId");
		
		List<HashMap<Object,Object>> imageList = new ArrayList<HashMap<Object,Object>>();
		HashMap<Object,Object> imageMap = new HashMap<Object,Object>();
		
		//map에 insert에 필요한 정보 넣기
		imageMap.put("questionId",questionId);
		if(file != null) {
			for(int i=0;i<file.size();i++) {
				if(!file.get(i).isEmpty() && file.get(i).getSize() > 0) {
					String fileName = saveUploadFile(file.get(i));
					imageMap.put("name",fileName);
					System.out.println(fileName);
					imageList.add(imageMap);
				}
			}
			//이미지 등록 
			mypageDao.addFrontMemberQuestionImage(imageList);
		}
	}
	
	public List<HashMap<Object,Object>> getFrontFreTitle(int id){
		return mypageDao.getFrontFreTitle(id);
	}
	
	public HashMap<Object,Object> getFrontFreDetail(int id){
		return mypageDao.getFrontFreDetail(id);
	}
	
	public List<HashMap<Object,Object>> getWithCategory(){
		return mypageDao.getWithCategory();
	}
	
	public void memberWithDraw(HashMap<Object,Object> map) {
		mypageDao.memberWithDraw(map);
	}
	
	public List<HashMap<Object,Object>> getAreaList(String zipCode){
		return mypageDao.getAreaList(zipCode);
	}
	
	public List<HashMap<Object,Object>> getMyShop(int memberId){
		return mypageDao.getMyShop(memberId);
	}
	
	public void updateShopInfo(ShopInfoUpdateBean bean) {
		
		
		//주소 정보 합치기
		bean.setAddress(bean.getAddress1() +  " " + bean.getAddress2());
		
		//휴일 정보 입력
		String holiday = "";
		
		for(int i=0;i<bean.getDay().length;i++) {
			
			if(i == 0) {
				holiday = bean.getDay()[i];
				continue;
			}
			
			holiday += "," + bean.getDay()[i];
			
		}
		
		bean.setHoliday(holiday);
		
		mypageDao.updateShopInfo(bean);
	}
	
	public List<HashMap<Object,Object>> getGoodsList(int shopIdx){
		return mypageDao.getGoodsList(shopIdx);
		
	}
	
	public void addGoods(HashMap<Object,Object> map) {
		mypageDao.addGoods(map);
	}
	
	public HashMap<Object,Object> getGoodsInfo(int goodsId){
		return mypageDao.getGoodsInfo(goodsId);
	}
	
	public void updateGoodsInfo(HashMap<Object,Object> map) {
		mypageDao.updateGoodsInfo(map);
	}
	
	public HashMap<Object,Object> getProInfo(int shopIdx){
		return mypageDao.getProInfo(shopIdx);
	}
	
	public List<String> getProImg(int shopIdx){
		return mypageDao.getProImg(shopIdx);
	}
	
	public List<String> getProKeyword(int shopIdx){
		return mypageDao.getProKeyword(shopIdx);
	}
	
	public boolean checkShopName(String shopName) {
		String name = mypageDao.checkShopName(shopName);
		if(name != null) {
			return false;
		}else {
			return true;
		}
	}
	
	public void updateShopProfile(ProfileUpdateBean bean) {
		
		List<HashMap<Object,Object>> imgList = new ArrayList<HashMap<Object,Object>>();
		List<HashMap<Object,Object>> keyList = new ArrayList<HashMap<Object,Object>>();
		
		
		if(bean.getUploadFile() != null && bean.getUploadFile().getSize() > 0) {
			
			String mainImage = saveUploadFile(bean.getUploadFile());
			bean.setMainImage(mainImage);

		}
		
		//회원 정보 수정 
		mypageDao.updateShopProfile(bean);
		
		//이미지 삭제
		mypageDao.deleteShopImage(bean.getShopIdx());

		if(bean.getMulUploadFile() != null) {
			for(int i=0;i<bean.getMulUploadFile().size();i++) {
				if(!bean.getMulUploadFile().get(i).isEmpty() && bean.getMulUploadFile().get(i).getSize() > 0) {
					
					HashMap<Object,Object> imgMap = new HashMap<Object,Object>();
					imgMap.put("shopIdx",bean.getShopIdx());
					
					String imageName = saveUploadFile(bean.getMulUploadFile().get(i));
					imgMap.put("imageName",imageName);
					
					imgList.add(imgMap);
					
				}
			}
		}
		
		//이미지 추가
		mypageDao.addShopImage(imgList);
		
		//키워드 삭제
		mypageDao.deleteShopKeyword(bean.getShopIdx());
		
		
		if(bean.getKeyword() != null) {
			for(int i=0;i<bean.getKeyword().size();i++) {
				
				HashMap<Object,Object> keyMap = new HashMap<Object,Object>();
				keyMap.put("shopIdx",bean.getShopIdx());
				keyMap.put("keyword", bean.getKeyword().get(i));
				
				keyList.add(keyMap);
				
			}
		}
		
		//키워드 등록 
		mypageDao.addShopKeyword(keyList);
		
	}
	
	public List<HashMap<Object,Object>> getShopBookmark(int shopIdx){
		return mypageDao.getShopBookmark(shopIdx);
	}
	
	public int getShopBookmarkCnt(int shopIdx) {
		return mypageDao.getShopBookmarkCnt(shopIdx);
	}
	
	
}
