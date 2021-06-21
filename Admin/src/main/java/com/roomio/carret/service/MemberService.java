package com.roomio.carret.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.roomio.carret.bean.MemberManageBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.ShopApplySearchBean;
import com.roomio.carret.dao.MemberDao;


@Service
public class MemberService {
	
	@Value("${page.listCut}")
	private int listCnt;
	
	@Value("${page.paginationCnt}")
	private int paginationCnt;
	
	@Autowired
	private MemberDao memberDao;
	
	public PageBean getShopApplyCnt(int page,MemberManageBean memberManageBean) {
		
		int roleGroupsCnt = memberDao.getMemberListCnt(memberManageBean);
		PageBean pageBean = new PageBean(page,roleGroupsCnt,listCnt,paginationCnt);
		return pageBean;
		
	}
	
	public List<HashMap<Object,Object>> getMemberList(int page,MemberManageBean memberManageBean){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return memberDao.getMemberList(memberManageBean,rowBounds);
	}
	
}
