package com.roomio.carret.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.QuestionRegisterBean;
import com.roomio.carret.dao.OperationDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class OperationService {

	@Autowired
	private OperationDao operationDao;
	
	@Value("${page.listCut}")
	private int listCnt;
	
	@Value("${page.paginationCnt}")
	private int paginationCnt;
	
	@Value("${path.upload}")
	private String pathUpload;
	
	public HashMap<Object,Object> getQuestion(int questionId){
		
		return operationDao.getQuestion(questionId);
	}
	
	public void addQuestionAnswer(int questionId,
								String content,
								int sendMessage,
								int franchiseManagerId) {
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("questionId", questionId);
		map.put("content",content);
		map.put("sendMessage",sendMessage);
		map.put("franchiseManagerId",franchiseManagerId);
		
		// 문의 답변 등록
		operationDao.addQuestionAnswer(map);
		
		// 문의 상태 업데이트(답변완료)
		operationDao.updateQuestion(questionId);
		
	}
	
	public List<HashMap<Object,Object>> getQuestionCategory(){
		
		return operationDao.getQuestionCategory();
		
	}
	
	public List<HashMap<Object,Object>> getQuestionList(int page,QuestionRegisterBean bean,int selectNum){
		int start = (page - 1) * selectNum;
		RowBounds rowBounds = new RowBounds(start,selectNum);
		return operationDao.getQuestionList(bean,rowBounds);
	}
	
	public PageBean getQuestionCnt(int page,QuestionRegisterBean bean,int selectNum) {
		int questionCnt = operationDao.getQuestionCnt(bean);
		PageBean pageBean = new PageBean(page,questionCnt,selectNum,paginationCnt);
		return pageBean;
	}
	
	public int getQuestionRealCnt(int page,QuestionRegisterBean bean) {
		int questionCnt = operationDao.getQuestionCnt(bean);
		return questionCnt;
	}
	
	public HashMap<Object,Object> getReportInfo(int reportId){
		return operationDao.getReportInfo(reportId);
	}
	
	public void addReportReply(int reportId,
			String content,
			int sendMessage,
			int franchiseManagerId) {

	HashMap<Object,Object> map = new HashMap<Object,Object>();
	map.put("reportId", reportId);
	map.put("content",content);
	map.put("sendMessage",sendMessage);
	map.put("franchiseManagerId",franchiseManagerId);
	
	// 신고 답변 등록
	operationDao.addReportReply(map);

	// 신고 상태 업데이트(답변완료)
	operationDao.updateReport(reportId);
	
	}
	
	public List<HashMap<Object,Object>> getReportList(int page,QuestionRegisterBean bean,int selectNum){
		int start = (page - 1) * selectNum;
		RowBounds rowBounds = new RowBounds(start,selectNum);
		return operationDao.getReportList(bean,rowBounds);
	}
	
	public PageBean getReportCnt(int page,QuestionRegisterBean bean,int selectNum) {
		int reportCnt = operationDao.getReportCnt(bean);
		PageBean pageBean = new PageBean(page,reportCnt,selectNum,paginationCnt);
		return pageBean;
	}
	
	public int getReportRealCnt(int page,QuestionRegisterBean bean) {
		int reportCnt = operationDao.getReportCnt(bean);
		return reportCnt;
	}
	
	public List<HashMap<Object,Object>> getFreQuestionCategory(){
		List<HashMap<Object,Object>> list = operationDao.getFreQuestionCategory();
		return list;
	}
	
	
}
