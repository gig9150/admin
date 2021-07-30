package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.FAQSearchBean;
import com.roomio.carret.bean.QuestionRegisterBean;

@Repository
public class OperationDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public HashMap<Object,Object> getQuestion(int questionId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.operation.getQuestion",questionId);
	}
	
	public void addQuestionAnswer(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.operation.addQuestionAnswer",map);
	}
	
	public void updateQuestion(int questionId) {
		sqlSessionTemplate.update("com.roomio.carret.operation.updateQuestion",questionId);
	}
	
	public List<HashMap<Object,Object>> getQuestionCategory(){
		return sqlSessionTemplate.selectList("com.roomio.carret.operation.getQuestionCategory");
	}
	
	public List<HashMap<Object,Object>> getQuestionList(QuestionRegisterBean bean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.operation.getQuestionList",bean,rowBounds);
	}
	
	public int getQuestionCnt(QuestionRegisterBean bean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.operation.getQuestionCnt",bean);
	}
	
	public HashMap<Object,Object> getReportInfo(int reportId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.operation.getReportInfo",reportId);
	}
	
	public void addReportReply(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.operation.addReportReply",map);
	}
	
	public void updateReport(int reportId) {
		sqlSessionTemplate.update("com.roomio.carret.operation.updateReport",reportId);
	}
	
	public int getReportCnt(QuestionRegisterBean bean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.operation.getReportCnt",bean);
	}
	
	public List<HashMap<Object,Object>> getReportList(QuestionRegisterBean bean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.operation.getReportList",bean,rowBounds);
	}
	
	public List<HashMap<Object,Object>> getFreQuestionCategory(){
		return sqlSessionTemplate.selectList("com.roomio.carret.operation.getFreQuestionCategory");
	}
	
	public void addFAQ(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.operation.addFAQ",map);
	}
	
	public void addFranFAQ(List<HashMap<Object,Object>> list) {
		sqlSessionTemplate.insert("com.roomio.carret.operation.addFranFAQ",list);
	}
	
	public HashMap<Object,Object> getFAQInfo(int id){
		return sqlSessionTemplate.selectOne("com.roomio.carret.operation.getFAQInfo",id);
	}
	
	public void updateFAQ(HashMap<Object,Object> map) {
		sqlSessionTemplate.update("com.roomio.carret.operation.updateFAQ",map);
	}
	
	public void deleteFAQ(int id) {
		sqlSessionTemplate.delete("com.roomio.carret.operation.deleteFAQ",id);
	}
	
	public List<HashMap<Object,Object>> getFAQList(FAQSearchBean bean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.operation.getFAQList",bean,rowBounds);
	}
	
	public int getFAQCnt(FAQSearchBean bean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.operation.getFAQCnt",bean);
	}
	
	public int updateViewStatus1(List<Integer> id) {
		return sqlSessionTemplate.update("com.roomio.carret.operation.updateViewStatus1",id);
	}
	
	public int updateViewStatus2(List<Integer> id) {
		return sqlSessionTemplate.update("com.roomio.carret.operation.updateViewStatus2",id);
	}
	
	public void addNotice(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.operation.addNotice",map);
	}
	
	public void addNoticeFran(List<HashMap<Object,Object>> list) {
		sqlSessionTemplate.insert("com.roomio.carret.operation.addNoticeFran",list);
	}
	
	public HashMap<Object,Object> getNoticeInfo(int id){
		return sqlSessionTemplate.selectOne("com.roomio.carret.operation.getNoticeInfo",id);
	}
	
	public void updateNotice(HashMap<Object,Object> map) {
		sqlSessionTemplate.update("com.roomio.carret.operation.updateNotice",map);
	}
	
	public void deleteNotice(int id) {
		sqlSessionTemplate.delete("com.roomio.carret.operation.deleteNotice",id);
	}
	
	public List<HashMap<Object,Object>> getNoticeList(FAQSearchBean bean,RowBounds rowBounds) {
		return sqlSessionTemplate.selectList("com.roomio.carret.operation.getNoticeList",bean,rowBounds);
	}
	
	public int getNoticeCnt(FAQSearchBean bean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.operation.getNoticeCnt",bean);
	}
	
	public int updateNoticeViewStatus1(List<Integer> id) {
		return sqlSessionTemplate.update("com.roomio.carret.operation.updateNoticeViewStatus1",id);
	}
	
	public int updateNoticeViewStatus2(List<Integer> id) {
		return sqlSessionTemplate.update("com.roomio.carret.operation.updateNoticeViewStatus2",id);
	}
}
