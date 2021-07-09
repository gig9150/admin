package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.MemberManageBean;
import com.roomio.carret.bean.MemberPenaltyBean;
import com.roomio.carret.bean.MemberRegisterBean;
import com.roomio.carret.bean.MemberUpdateBean;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<HashMap<Object,Object>> getMemberList(MemberManageBean memberManageBean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.member.getMemberList",memberManageBean,rowBounds);
	}
	
	public int getMemberListCnt(MemberManageBean memberManageBean){
		return sqlSessionTemplate.selectOne("com.roomio.carret.member.getMemberListCnt",memberManageBean);
	}
	
	public List<HashMap<Object,Object>> getMemberPenaltyList(MemberPenaltyBean memberPenaltyBean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.member.getMemberPenaltyList",memberPenaltyBean,rowBounds);
	}
	
	public int getMemberPenaltyCnt(MemberPenaltyBean memberPenaltyBean){
		return sqlSessionTemplate.selectOne("com.roomio.carret.member.getMemberPenaltyCnt",memberPenaltyBean);
	}
	
	public void addFrontMember(MemberRegisterBean memberRegisterBean) {
		sqlSessionTemplate.selectList("com.roomio.carret.member.addFrontMember",memberRegisterBean);
	}
	
	public String frontMemberNameChk(String name) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.member.frontMemberNameChk",name);
	}
	
	public void frontMemberInfoUpdate(MemberUpdateBean memberUpdateBean) {
		sqlSessionTemplate.update("com.roomio.carret.member.frontMemberInfoUpdate",memberUpdateBean);
	}
	
}
