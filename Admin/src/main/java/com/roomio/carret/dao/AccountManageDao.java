package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.MemberSearchBean;

@Repository
public class AccountManageDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<HashMap<Object,Object>> getAreaList(){
		
		return sqlSessionTemplate.selectList("com.roomio.carret.accountManage.getAreaList");
	}
	
	public List<HashMap<Object,Object>> getMemberList(MemberSearchBean bean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.accountManage.getMemberList",bean,rowBounds);
	}
	
	public int getMemberCnt(MemberSearchBean bean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.accountManage.getMemberCnt",bean);
	}
	
}
