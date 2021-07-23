package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.MemberSearchBean;
import com.roomio.carret.bean.ShopUpdateBean;

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
	
	public HashMap<Object,Object> getMemberSta(int memberId){
		return sqlSessionTemplate.selectOne("com.roomio.carret.accountManage.getMemberSta",memberId);
	}
	
	public List<HashMap<Object,Object>>  getMemberUpdate(int memberId){
		return sqlSessionTemplate.selectList("com.roomio.carret.accountManage.getMemberUpdate",memberId);
	}
	
	public List<HashMap<Object, Object>> getMemberPenalty(int memberId){
		
		return sqlSessionTemplate.selectList("com.roomio.carret.accountManage.getMemberUpdate",memberId);
	}
	
	public void updateMemberInfo(int memberId) {
		sqlSessionTemplate.update("com.roomio.carret.accountManage.updateMemberInfo",memberId);
	}
	
	public List<HashMap<Object,Object>> getMemberPenaltyList(int memberId,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.accountManage.getMemberPenaltyList",memberId,rowBounds);
	}
	
	public int getMemberPenaltyCnt(int memberId) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.accountManage.getMemberPenaltyCnt",memberId);
		
	}
	
	public void addMemberPenalty(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.accountManage.addMemberPenalty",map);
	}
	
	public List<HashMap<Object,Object>> getSectorList(){
		return sqlSessionTemplate.selectList("com.roomio.carret.accountManage.getSectorList");
	}
	
	public List<HashMap<Object,Object>> getShopList(MemberSearchBean bean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.accountManage.getShopList",bean,rowBounds);
	}
	
	public int getShopCnt(MemberSearchBean bean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.accountManage.getShopCnt",bean);
	}
	
	public HashMap<Object,Object> getShopDeatil(int shopIdx){
		return sqlSessionTemplate.selectOne("com.roomio.carret.accountManage.getShopDeatil",shopIdx);
	}
	
	public HashMap<Object,Object> getShopDetailTwo(int shopIdx){
		return sqlSessionTemplate.selectOne("com.roomio.carret.accountManage.getShopDetailTwo",shopIdx);
	}
	
	public List<HashMap<Object,Object>> getShopDetailThree(int shopIdx){
		return sqlSessionTemplate.selectList("com.roomio.carret.accountManage.getShopDetailThree",shopIdx);
	}
	
	public void shopUpdate(ShopUpdateBean bean) {
		sqlSessionTemplate.update("com.roomio.carret.accountManage.shopUpdate",bean);
	}
	
	public void memberNameUpdate(ShopUpdateBean bean) {
		sqlSessionTemplate.update("com.roomio.carret.accountManage.memberNameUpdate",bean);
	}
	
	public List<HashMap<Object,Object>> getShopUpdateList(int shopIdx){
		return sqlSessionTemplate.selectList("com.roomio.carret.accountManage.getShopUpdateList",shopIdx);
	}
	
	public List<HashMap<Object,Object>> getShopPenaltyList(int shopIdx){
		return sqlSessionTemplate.selectList("com.roomio.carret.accountManage.getShopPenaltyList",shopIdx);
	}
	
	public List<HashMap<Object,Object>> getShopPenalty(int shopIdx,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.accountManage.getShopPenaltyList",shopIdx,rowBounds);
	}
	
	public int getShopPenaltyCnt(int shopIdx) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.accountManage.getShopPenaltyCnt",shopIdx);
	}
	
	public void addShopPenalty(HashMap<Object,Object> map) {
		sqlSessionTemplate.insert("com.roomio.carret.accountManage.addShopPenalty",map);
	}

	
}
