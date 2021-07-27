package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.ShopApplySearchBean;
import com.roomio.carret.bean.ShopCurationBean;
import com.roomio.carret.bean.ShopRegisterBean;
import com.roomio.carret.bean.ShopSearchBean;

@Repository
public class ShopDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<HashMap<Object,Object>> getFranchiseName(){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getFranchiseName");
	}
	
	public List<HashMap<Object,Object>> getAreaList(){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getAreaList");
	}
	
	public List<HashMap<Object,Object>> getAreaSigunguList(int areaCode){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getAreaSigunguList",areaCode);
	}
	
	public List<HashMap<Object,Object>> getAreaSigunguDefault(){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getAreaSigunguDefault");
	}
	
	public int getShopCnt(ShopSearchBean shopSearchBean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.getShopCnt",shopSearchBean);
	}
	
	public List<HashMap<Object,Object>> getShopList(ShopSearchBean shopSearchBean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getShopList",shopSearchBean,rowBounds);
	}
	
	public int getShopApplyCnt(ShopApplySearchBean shopApplySearchBean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.getShopApplyCnt",shopApplySearchBean);
	}
	
	public List<HashMap<Object,Object>> getShopApplyList(ShopApplySearchBean shopApplySearchBean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getShopApplyList",shopApplySearchBean,rowBounds);
	}
	
	public HashMap<Object,Object> getApplyInfo(int shopIdx){
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.getApplyInfo",shopIdx);
	}
	
	public void updateShopApplyInfo(HashMap<Object,Object> applyInfoMap) {
		sqlSessionTemplate.update("com.roomio.carret.shop.updateShopApplyInfo",applyInfoMap);
	}
	
	public List<String> getAttachedImg(int shopIdx){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getAttachedImg",shopIdx);
	}
	
	public HashMap<Object,Object> getFrontShopDetail(int shopIdx){
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.getFrontShopDetail",shopIdx);
	}
	
	public List<HashMap<Object,Object>> getFrontShopGoods(int shopIdx){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getFrontShopGoods",shopIdx);
	}
	
	public List<HashMap<Object,Object>> getFrontShopReviews(HashMap<Object,Object> reviewMap){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getFrontShopReviews",reviewMap);
	}
	
	public List<HashMap<Object,Object>> getFrontShopNews(int shopIdx){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getFrontShopNews",shopIdx);
	}
	
	public HashMap<Object,Object> getFrontShopNewsDetail(int shopNewsId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.getFrontShopNewsDetail",shopNewsId);
	}
	
	public void addShopNewsComment(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.shop.addShopNewsComment",map);
	}
	
	public List<HashMap<Object,Object>> getShopNewsComments(int shopNewsId){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getShopNewsComments",shopNewsId);
	}
	
	public void addShopReview(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.shop.addFrontShopReview",map);
	}
	
	public void addShopReviewKeyword(HashMap<Object,Object> keywordMap) {
		sqlSessionTemplate.insert("com.roomio.carret.shop.addFrontShopReviewKeyword",keywordMap);
	}
	
	public void addShopReviewImage(HashMap<Object,Object> imageMap) {
		sqlSessionTemplate.insert("com.roomio.carret.shop.addFrontShopReviewImage",imageMap);
	}
	
	public List<HashMap<Object,Object>> getFrontReviewCategory(){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getFrontReviewCategory");
	}
	
	public int getFrontShopReviewCnt() {
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.getFrontShopReviewCnt");
	}
	
	public Integer checkFrontShopMember(HashMap<Object,Object> map) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.checkFrontShopMember",map);
	}
	
	public int getBookmarkShopCnt(int shopIdx) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.getBookmarkShopCnt",shopIdx);
	}
	
	public void addBookmarkShop(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.shop.addBookmarkShop",map);
	}
	
	public void deleteBookmarkShop(HashMap<Object,Object> map) {
		sqlSessionTemplate.delete("com.roomio.carret.shop.deleteBookmarkShop",map);
	}
	
	public List<HashMap<Object,Object>> getFrontReportCategory(){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getFrontReportCategory");
	}
	
	public void addFrontShopReport(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.shop.addFrontShopReport",map);
	}
	
	public void addFrontShopNewsReport(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.shop.addFrontShopNewsReport",map);
	}
	
	public void addFrontShop(ShopRegisterBean shopRegisterBean) {
		sqlSessionTemplate.insert("com.roomio.carret.shop.addFrontShop",shopRegisterBean);
	}
	
	public void addFrontShopKeyword(HashMap<Object,Object> keywordMap) {
		sqlSessionTemplate.insert("com.roomio.carret.shop.addFrontShopKeyword",keywordMap);
	}
	
	public List<ShopCurationBean> getFrontShopPromotion(int franchiseId) {
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getFrontShopPromotion",franchiseId);
	}
	
	public List<HashMap<Object,Object>> getFrontShopPromotionArea(HashMap<Object,Object> map){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getFrontShopPromotionArea",map);
	}
	
	public List<HashMap<Object, Object>> getFrontShopPromotionCuration(HashMap<Object,Object> map){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getFrontShopPromotionCuration",map);
	}
	
	public HashMap<Object,Object> getFrontCurationBannerImage(int shopExhiId) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.getFrontCurationBannerImage",shopExhiId);
	}
	
	public List<HashMap<Object,Object>> getNewsList(HashMap<Object,Object> map){
		return sqlSessionTemplate.selectList("com.roomio.carret.shop.getNewsList",map);
	}
	
	public HashMap<Object,Object> getNewsDetailInfo(HashMap<Object,Object> map){
		return sqlSessionTemplate.selectOne("com.roomio.carret.shop.getNewsDetailInfo",map);
	}
	
	public void addShopReport(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.shop.addShopReport",map);
	}
	
	public int addNewsLike(HashMap<Object,Object> map) {
		return sqlSessionTemplate.insert("com.roomio.carret.shop.addNewsLike",map);
	}
	
	public int delNewsLike(HashMap<Object,Object> map) {
		return sqlSessionTemplate.delete("com.roomio.carret.shop.delNewsLike",map);
	}
}
