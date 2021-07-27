package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.ProfileUpdateBean;
import com.roomio.carret.bean.ShopInfoUpdateBean;
import com.roomio.carret.bean.ShopUpdateBean;

@Repository
public class MypageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<HashMap<Object,Object>> getFrontBookmarkShop(int memberId){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getFrontBookmarkShop",memberId);
	}
	
	public List<HashMap<Object,Object>> getFrontReviewShop(int memberId){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getFrontReviewShop",memberId);
	}
	
	public List<HashMap<Object,Object>> getFrontMemberQuestion(int memberId){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getFrontMemberQuestion",memberId);
	}
	
	public List<HashMap<Object,Object>> getFrontFrequentQuestionCategory(){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getFrontFrequentQuestionCategory");
	}
	
	public HashMap<Object,Object> getFrontFrequentQuestion(int frequentQuestionId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.mypage.getFrontFrequentQuestion",frequentQuestionId);
	}
	
	public List<HashMap<Object,Object>> getFrontNotice(){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getFrontNotice");
	}
	
	public HashMap<Object,Object> getFrontNoticeDetail(int noticeId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.mypage.getFrontNoticeDetail",noticeId);
	}
	
	public HashMap<Object,Object> getFrontQuestionMemberInfo(int memberId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.mypage.getFrontQuestionMemberInfo",memberId);
	}
	
	public List<HashMap<Object,Object>> getFrontQuestionCategory(){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getFrontQuestionCategory");
	}
	
	public void addFrontMemberQuestion(HashMap<Object,Object> questionMap) {
		sqlSessionTemplate.insert("com.roomio.carret.mypage.addFrontMemberQuestion",questionMap);
	}
	
	public void addFrontMemberQuestionImage(List<HashMap<Object,Object>> list) {
		sqlSessionTemplate.insert("com.roomio.carret.mypage.addFrontMemberQuestionImage",list);
	}
	
	public List<HashMap<Object,Object>> getFrontFreTitle(int id){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getFrontFreTitle",id);
	}
	
	public HashMap<Object,Object> getFrontFreDetail(int id){
		return sqlSessionTemplate.selectOne("com.roomio.carret.mypage.getFrontFreDetail",id);
	}
	
	public List<HashMap<Object,Object>> getWithCategory(){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getWithCategory");
	}
	
	public void memberWithDraw(HashMap<Object,Object> map) {
		sqlSessionTemplate.update("com.roomio.carret.mypage.memberWithDraw",map);
	}
	
	public List<HashMap<Object,Object>> getAreaList(String zipCode){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getAreaList",zipCode);
	}
	
	public List<HashMap<Object,Object>> getMyShop(int memberId){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getMyShop",memberId);
	}
	
	public void updateShopInfo(ShopInfoUpdateBean bean) {
		sqlSessionTemplate.update("com.roomio.carret.mypage.updateShopInfo",bean);
	}
	
	public List<HashMap<Object,Object>> getGoodsList(int shopIdx){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getGoodsList",shopIdx);
	}
	
	public void addGoods(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.mypage.addGoods",map);
	}
	
	public HashMap<Object,Object> getGoodsInfo(int goodsId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.mypage.getGoodsInfo",goodsId);
	}
	
	public void updateGoodsInfo(HashMap<Object,Object> map) {
		sqlSessionTemplate.update("com.roomio.carret.mypage.updateGoodsInfo",map);
	}
	
	public HashMap<Object,Object> getProInfo(int shopIdx){
		return sqlSessionTemplate.selectOne("com.roomio.carret.mypage.getProInfo",shopIdx);
	}
	
	public List<String> getProImg(int shopIdx){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getProImg",shopIdx);
	}
	
	public List<String> getProKeyword(int shopIdx){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getProKeyword",shopIdx);
	}
	
	public String checkShopName(String shopName) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.mypage.checkShopName",shopName);
	}
	
	public void updateShopProfile(ProfileUpdateBean bean) {
		sqlSessionTemplate.update("com.roomio.carret.mypage.updateShopProfile",bean);
	}
	
	public void deleteShopImage(int shopIdx) {
		sqlSessionTemplate.delete("com.roomio.carret.mypage.deleteShopImage",shopIdx);
	}
	
	public void addShopImage(List<HashMap<Object,Object>> list) {
		sqlSessionTemplate.delete("com.roomio.carret.mypage.addShopImage",list);
	}
	
	public void deleteShopKeyword(int shopIdx) {
		sqlSessionTemplate.delete("com.roomio.carret.mypage.deleteShopKeyword",shopIdx);
	}
	
	public void addShopKeyword(List<HashMap<Object,Object>> list) {
		sqlSessionTemplate.delete("com.roomio.carret.mypage.addShopKeyword",list);
	}
	
	public List<HashMap<Object,Object>> getShopBookmark(int shopIdx){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getShopBookmark",shopIdx);
	}
	
	public int getShopBookmarkCnt(int shopIdx) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.mypage.getShopBookmarkCnt",shopIdx);
	}
	
	public List<HashMap<Object,Object>> getNewsCate(){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getNewsCate");
	}
	
	public void addShopNews(HashMap<Object, Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.mypage.addShopNews",map);
	}
	
	public void addShopNewsImg(List<HashMap<Object,Object>> list) {
		sqlSessionTemplate.insert("com.roomio.carret.mypage.addShopNewsImg",list);
	}
	
	public List<HashMap<Object,Object>> getReviewList(int shopIdx){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getReviewList",shopIdx);
	}
	
	public void reviewReply(HashMap<Object,Object> map) {
		sqlSessionTemplate.update("com.roomio.carret.mypage.reviewReply",map);
	}
	
	public String chkMemShop(HashMap<Object,Object> map) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.mypage.chkMemShop",map);
	}
	
	
}
