package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
