package com.roomio.carret.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.roomio.carret.bean.MemberSearchBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.dao.AccountManageDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class AccountManageService {

	@Autowired
	private AccountManageDao accountManageDao;
	
	@Value("${page.listCut}")
	private int listCnt;
	
	@Value("${page.paginationCnt}")
	private int paginationCnt;
	
	@Value("${path.upload}")
	private String pathUpload;
	
	public List<HashMap<Object,Object>> getAreaList(){
		
		return accountManageDao.getAreaList();
	}
	
	public List<HashMap<Object,Object>> getMemberList(int page,MemberSearchBean bean,int selectNum){
		int start = (page - 1) * selectNum;
		RowBounds rowBounds = new RowBounds(start,selectNum);
		return accountManageDao.getMemberList(bean,rowBounds);
	}
	
	public PageBean getMemberCnt(int page,MemberSearchBean bean,int selectNum) {
		int memberCnt = accountManageDao.getMemberCnt(bean);
		PageBean pageBean = new PageBean(page,memberCnt,selectNum,paginationCnt);
		return pageBean;
	}
	
	public int getMemberRealCnt(MemberSearchBean bean) {
		int memberCnt = accountManageDao.getMemberCnt(bean);
		return memberCnt;
	}
	
	public HashMap<Object,Object> getMemberSta(int memberId){
		return accountManageDao.getMemberSta(memberId);
	}
	
	public List<HashMap<Object,Object>> getMemberUpdate(int memberId){
		return accountManageDao.getMemberUpdate(memberId);
	}
	
	public List<HashMap<Object,Object>> getMemberPenalty(int memberId){
		return accountManageDao.getMemberPenalty(memberId);
	}
	
	public void updateMemberInfo(int memberId) {
		accountManageDao.updateMemberInfo(memberId);
	}
}
