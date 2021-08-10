package com.roomio.carret.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.roomio.carret.bean.FAQSearchBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.WordSearchBean;
import com.roomio.carret.dao.ContentDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ContentService {
	
	@Value("${page.listCut}")
	private int listCnt;
	
	@Value("${page.paginationCnt}")
	private int paginationCnt;
	
	@Value("${path.upload}")
	private String pathUpload;

	@Autowired
	private ContentDao contentDao;
	
	public int addProWord(HashMap<Object,Object> map) {
		return contentDao.addProWord(map);
	}
	
	public List<HashMap<Object,Object>> getProWord(int page,WordSearchBean bean,int selectNum){
		int start = (page - 1) * selectNum;
		RowBounds rowBounds = new RowBounds(start,selectNum);
		return contentDao.getProWord(bean,rowBounds);
	}
	
	public PageBean getProWordCnt(int page,WordSearchBean bean,int selectNum) {
		int shopCnt = contentDao.getProWordCnt(bean);
		PageBean pageBean = new PageBean(page,shopCnt,selectNum,paginationCnt);
		return pageBean;
	}
	
	public int getProWordRealCnt(WordSearchBean bean) {
		int shopCnt = contentDao.getProWordCnt(bean);
		return shopCnt;
	}
	
	public int deleteProword(int id) {
		return contentDao.deleteProword(id);
	}
	
	public int deleteAllProword(List<Integer> list) {
		return contentDao.deleteAllProword(list);
	}
	
	public HashMap<Object,Object> getNewsInfo(int id){
		return contentDao.getNewsInfo(id);
	}
	
	public List<HashMap<Object,Object>> getNewsUpdateList(int id){
		return contentDao.getNewsUpdateList(id);
	}
}
