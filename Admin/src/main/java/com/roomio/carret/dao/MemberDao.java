package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.MemberManageBean;

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
	
}
