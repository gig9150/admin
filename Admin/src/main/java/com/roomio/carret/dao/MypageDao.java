package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public List<String> getFrontFrequentQuestionCategory(){
		return sqlSessionTemplate.selectList("com.roomio.carret.mypage.getFrontFrequentQuestionCategory");
	}
	
	public HashMap<Object,Object> getFrontFrequentQuestion(int frequentQuestionId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.mypage.getFrontFrequentQuestion");
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
	
}
