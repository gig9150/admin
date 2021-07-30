package com.roomio.carret.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.ShopApplySearchBean;
import com.roomio.carret.bean.ShopCurationBean;
import com.roomio.carret.bean.ShopRegisterBean;
import com.roomio.carret.bean.ShopSearchBean;
import com.roomio.carret.dao.ShopDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ShopService {
	
	
	
	@Value("${page.listCut}")
	private int listCnt;
	
	@Value("${page.paginationCnt}")
	private int paginationCnt;

	@Autowired
	private ShopDao shopDao;
	
	public List<HashMap<Object,Object>> getFranchiseName(){
		return shopDao.getFranchiseName();
	}
	
	public List<HashMap<Object,Object>> getAreaList(){
		return shopDao.getAreaList();
	}
	
	public List<HashMap<Object,Object>> getAreaSigunguList(int areaCode){
		return shopDao.getAreaSigunguList(areaCode);
	}
	
	public List<HashMap<Object,Object>> getAreaSigunguDefault(){
		return shopDao.getAreaSigunguDefault();
	}

	public int getShopRealCnt(ShopSearchBean shopSearchBean) {
		return shopDao.getShopCnt(shopSearchBean);
	}
	
	public PageBean getShopCnt(int page,ShopSearchBean shopSearchBean) {
		int roleGroupsCnt = shopDao.getShopCnt(shopSearchBean);
		PageBean pageBean = new PageBean(page,roleGroupsCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	
	public List<HashMap<Object,Object>> getShopList(int page,ShopSearchBean shopSearchBean){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return shopDao.getShopList(shopSearchBean,rowBounds);
	}
	
	public PageBean getShopApplyCnt(int page,ShopApplySearchBean shopApplySearchBean) {
		int roleGroupsCnt = shopDao.getShopApplyCnt(shopApplySearchBean);
		PageBean pageBean = new PageBean(page,roleGroupsCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public List<HashMap<Object,Object>> getShopApplyList(int page,ShopApplySearchBean shopApplySearchBean){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return shopDao.getShopApplyList(shopApplySearchBean,rowBounds);
	}
	
	public HashMap<Object,Object> getApplyInfo(int shopIdx){
		return shopDao.getApplyInfo(shopIdx);
	}
	
	public void updateShopApplyInfo(HashMap<Object,Object> applyInfoMap) {
		shopDao.updateShopApplyInfo(applyInfoMap);
	}
	
	public List<String> getAttachedImg(int shopIdx){
		return shopDao.getAttachedImg(shopIdx);
	}
	
	public HashMap<Object,Object> getFrontShopDetail(int shopIdx){
		return shopDao.getFrontShopDetail(shopIdx);
	}
	
	public List<HashMap<Object,Object>> getFrontShopGoods(int shopIdx){
		return shopDao.getFrontShopGoods(shopIdx);
	}
	
	public List<HashMap<Object,Object>> getFrontShopReviews(HashMap<Object,Object> reviewMap){
		return shopDao.getFrontShopReviews(reviewMap);
	}
	
	public List<HashMap<Object,Object>> getFrontShopNews(int shopIdx){
		return shopDao.getFrontShopNews(shopIdx);
	}
	
	public int getFrontShopReviewCnt() {
		return shopDao.getFrontShopReviewCnt();
	}
	
	public HashMap<Object,Object> getFrontShopNewsDetail(int shopNewsId){
		return shopDao.getFrontShopNewsDetail(shopNewsId);
	}
	
	public void addShopNewsComment(HashMap<Object,Object> map) {
		shopDao.addShopNewsComment(map);
	}
	
	public List<HashMap<Object,Object>> getShopNewsComments(int shopNewsId){
		return shopDao.getShopNewsComments(shopNewsId);
	}
	
	public List<HashMap<Object,Object>> getFrontReviewCategory(){
		return shopDao.getFrontReviewCategory();
	}
	
	//업로드된 파일 이름 얻는 메소드 
	private String saveUploadFile(MultipartFile upload_file) {
		
		String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();
		
		try {
			upload_file.transferTo(new File("C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RoomioAdmin\\resources\\upload" + "/" + file_name));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	
	public void addShopReview(HashMap<Object,Object> map,
							String[] reviewKeywordCategoryId,
							List<MultipartFile> file) {
		
		// 리뷰 추가 
		shopDao.addShopReview(map);
		
		//insert 된 가게 리뷰 키값 얻어오기 
		int shopReviewId = (int)map.get("shopIdx");
		
		
		//키워드와 이미지 insert
		HashMap<Object,Object> keywordMap = new HashMap<Object,Object>();
		HashMap<Object,Object> imageMap = new HashMap<Object,Object>();
		
		keywordMap.put("shopReviewId", shopReviewId);
		imageMap.put("shopReviewId",shopReviewId);
		
		
		if(reviewKeywordCategoryId != null) {
			
			for(int i=0;i<reviewKeywordCategoryId.length;i++) {
				
				keywordMap.put("reviewKeywordCategoryId", Integer.parseInt(reviewKeywordCategoryId[i]));
				
				//리뷰 키워드 추가 
				shopDao.addShopReviewKeyword(keywordMap);
				
			}
			
		}
	
		
		if(file != null) {
			for(int i=0;i<file.size();i++) {
				
				if(!file.get(i).isEmpty() && file.get(i).getSize() > 0) {
					
					String fileName = saveUploadFile(file.get(i));
					imageMap.put("name",fileName);
					
					//리뷰 이미지 추가 
					shopDao.addShopReviewImage(imageMap);
				}
			}
		}
	}
	
	public Integer checkFrontShopMember(HashMap<Object,Object> map) {
		return shopDao.checkFrontShopMember(map);
	}
	
	public int getBookmarkShopCnt(int shopIdx) {
		return shopDao.getBookmarkShopCnt(shopIdx);
	}
	
	public void addBookmarkShop(HashMap<Object,Object> map) {
		shopDao.addBookmarkShop(map);
	}
	
	public void deleteBookmarkShop(HashMap<Object,Object> map) {
		shopDao.deleteBookmarkShop(map);
	}
	
	public List<HashMap<Object,Object>> getFrontReportCategory(){
		return shopDao.getFrontReportCategory();
	}
	
	public void addFrontShopReport(HashMap<Object,Object> map) {
		shopDao.addFrontShopReport(map);
	}
	
	public void addFrontShopNewsReport(HashMap<Object,Object> map) {
		shopDao.addFrontShopNewsReport(map);
	}
	
	public void addFrontShop(ShopRegisterBean shopRegisterBean) {
		
		if(!shopRegisterBean.getUploadFile().isEmpty()) {
			
			//파일 업로드 객체 생성 및 bean에 파일 이름 저장 
			MultipartFile uploadFile = shopRegisterBean.getUploadFile();
			
			if(uploadFile.getSize() > 0) {
				
				String fileName = saveUploadFile(uploadFile);
				shopRegisterBean.setBuisnessImageName(fileName);
	
			}
			
		}
		
		// 랜덤 코드 생성 
		
		String memberCode = new String();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		    	memberCode += (char) ((int) (rnd.nextInt(26)) + 97);
		        break;
		    case 1:
		        // A-Z
		    	memberCode += (char) ((int) (rnd.nextInt(26)) + 65);
		        break;
		    case 2:
		        // 0-9
		    	memberCode += rnd.nextInt(10);
		        break;
		    }
		}
		
		shopRegisterBean.setShopCode(memberCode);
		shopDao.addFrontShop(shopRegisterBean);
		
		//키워드 필수값아니므로 null 처리 
		if(shopRegisterBean.getKeyword() != null) {
			
			HashMap<Object,Object> keywordMap = new HashMap<Object,Object>();
			keywordMap.put("shopIdx", shopRegisterBean.getShopIdx());
			
			String[] keywordArray = shopRegisterBean.getKeyword();
			
			//키워드 값 insert (여러개 존재해서 배열로 받아줌 )
			for(int i=0;i<keywordArray.length;i++) {
				keywordMap.put("keyword",keywordArray[i]);
				shopDao.addFrontShopKeyword(keywordMap);
			}
		}
		
	}
	
	public List<ShopCurationBean> getFrontShopPromotion(int franchiseId){
		return shopDao.getFrontShopPromotion(franchiseId);
	}
	
	public List<HashMap<Object,Object>> getFrontShopPromotionArea(HashMap<Object,Object> map){
		return shopDao.getFrontShopPromotionArea(map);
	}
	
	public List<HashMap<Object,Object>> getFrontShopPromotionCuration(HashMap<Object,Object> map){
		return shopDao.getFrontShopPromotionCuration(map);
	}
	
	public HashMap<Object,Object> getFrontCurationBannerImage(int shopExhiId) {
		return shopDao.getFrontCurationBannerImage(shopExhiId);
	}
	
	public List<HashMap<Object,Object>> getNewsList(HashMap<Object,Object> map){
		return shopDao.getNewsList(map);
	}
	
	public HashMap<Object,Object> getNewsDetailInfo(HashMap<Object,Object> map){
		return shopDao.getNewsDetailInfo(map);
		
	}
	public void addShopReport(HashMap<Object,Object> map){
		shopDao.addShopReport(map);
	}
	
	public int addNewsLike(HashMap<Object,Object> map) {
		return shopDao.addNewsLike(map);
	}
	
	public int delNewsLike(HashMap<Object,Object> map) {
		return shopDao.delNewsLike(map);
	}
	
	public int addReviewLike(HashMap<Object,Object> map) {
		return shopDao.addReviewLike(map);
	}
	
	public int delReviewLike(HashMap<Object,Object> map) {
		return shopDao.delReviewLike(map);
	}
}
