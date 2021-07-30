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
import com.roomio.carret.bean.PenaltySearchBean;
import com.roomio.carret.bean.ShopUpdateBean;
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
	
	public List<HashMap<Object,Object>> getMemberPenaltyList(int page,int memberId){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return accountManageDao.getMemberPenaltyList(memberId,rowBounds);
	}
	
	public PageBean getMemberPenaltyCnt(int page,int memberId) {
		int penaltyCnt = accountManageDao.getMemberPenaltyCnt(memberId);
		PageBean pageBean = new PageBean(page,penaltyCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public int getMemberPenaltyRealCnt(int memberId) {
		int penaltyCnt = accountManageDao.getMemberPenaltyCnt(memberId);
		return penaltyCnt;
	}
	
	public void addMemberPenalty(HashMap<Object,Object> map) {
		accountManageDao.addMemberPenalty(map);
	}
	
	public List<HashMap<Object,Object>> getSectorList(){
		return accountManageDao.getSectorList();
	}
	
	public List<HashMap<Object,Object>> getShopList(int page,MemberSearchBean bean,int selectNum){
		int start = (page - 1) * selectNum;
		RowBounds rowBounds = new RowBounds(start,selectNum);
		return accountManageDao.getShopList(bean,rowBounds);
	}
	
	public PageBean getShopCnt(int page,MemberSearchBean bean,int selectNum) {
		int shopCnt = accountManageDao.getShopCnt(bean);
		PageBean pageBean = new PageBean(page,shopCnt,selectNum,paginationCnt);
		return pageBean;
	}
	
	public int getShopRealCnt(MemberSearchBean bean) {
		int shopCnt = accountManageDao.getShopCnt(bean);
		return shopCnt;
	}
	
	public HashMap<Object,Object> getShopDeatil(int shopIdx){
		return accountManageDao.getShopDeatil(shopIdx);
	}
	
	public HashMap<Object,Object> getShopDetailTwo(int shopIdx){
		return accountManageDao.getShopDetailTwo(shopIdx);
	}
	
	public List<HashMap<Object,Object>> getShopDetailThree(int shopIdx){
		return accountManageDao.getShopDetailThree(shopIdx);
	}
	
	public void shopUpdate(ShopUpdateBean bean) {
		accountManageDao.shopUpdate(bean);
		accountManageDao.memberNameUpdate(bean);
	}
	
	public List<HashMap<Object,Object>> getShopUpdateList(int shopIdx){
		return accountManageDao.getShopUpdateList(shopIdx);
	}
	
	public List<HashMap<Object,Object>> getShopPenaltyList(int shopIdx){
		return accountManageDao.getShopPenaltyList(shopIdx);
	}
	
	public List<HashMap<Object,Object>> getShopPenalty(int page,int memberId){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return accountManageDao.getShopPenalty(memberId,rowBounds);
	}
	
	public PageBean getShopPenaltyCnt(int page,int memberId) {
		int penaltyCnt = accountManageDao.getShopPenaltyCnt(memberId);
		PageBean pageBean = new PageBean(page,penaltyCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public int getShopPenaltyRealCnt(int memberId) {
		int penaltyCnt = accountManageDao.getShopPenaltyCnt(memberId);
		return penaltyCnt;
	}
	
	public void addShopPenalty(HashMap<Object,Object> map) {
		accountManageDao.addShopPenalty(map);
	}
	
	public List<HashMap<Object,Object>> getShopApplyList(int page,MemberSearchBean bean,int selectNum){
		int start = (page - 1) * selectNum;
		RowBounds rowBounds = new RowBounds(start,selectNum);
		return accountManageDao.getShopApplyList(bean,rowBounds);
	}
	
	public PageBean getShopApplyCnt(int page,MemberSearchBean bean,int selectNum) {
		int shopCnt = accountManageDao.getShopApplyCnt(bean);
		PageBean pageBean = new PageBean(page,shopCnt,selectNum,paginationCnt);
		return pageBean;
	}
	
	public int getShopApplyRealCnt(MemberSearchBean bean) {
		int shopCnt = accountManageDao.getShopApplyCnt(bean);
		return shopCnt;
	}
	
	public HashMap<Object,Object> getShopApplyInfo(int shopIdx){
		return accountManageDao.getShopApplyInfo(shopIdx);
	}
	
	public List<HashMap<Object,Object>> getShopHold(int shopIdx){
		return accountManageDao.getShopHold(shopIdx);
	}
	
	public void updateShopStatus(HashMap<Object,Object> map) {
		accountManageDao.updateShopStatus(map);
	}
	
	public List<HashMap<Object,Object>> getMemPenalty(int page,PenaltySearchBean bean,int selectNum){
		int start = (page - 1) * selectNum;
		RowBounds rowBounds = new RowBounds(start,selectNum);
		return accountManageDao.getMemPenalty(bean,rowBounds);
	}
	
	public PageBean getMemPenaltyCnt(int page,PenaltySearchBean bean,int selectNum) {
		int shopCnt = accountManageDao.getMemPenaltyCnt(bean);
		PageBean pageBean = new PageBean(page,shopCnt,selectNum,paginationCnt);
		return pageBean;
	}
	
	public int getMemPenaltyRealCnt(PenaltySearchBean bean) {
		int shopCnt = accountManageDao.getMemPenaltyCnt(bean);
		return shopCnt;
	}
	
	public List<HashMap<Object,Object>> getShopPenalty(int page,PenaltySearchBean bean,int selectNum){
		int start = (page - 1) * selectNum;
		RowBounds rowBounds = new RowBounds(start,selectNum);
		return accountManageDao.getShopPenalty(bean,rowBounds);
	}
	
	public PageBean getShopPenaltyCount(int page,PenaltySearchBean bean,int selectNum) {
		int shopCnt = accountManageDao.getShopPenaltyCount(bean);
		PageBean pageBean = new PageBean(page,shopCnt,selectNum,paginationCnt);
		return pageBean;
	}
	
	public int getShopPenaltyRealCount(PenaltySearchBean bean) {
		int shopCnt = accountManageDao.getShopPenaltyCount(bean);
		return shopCnt;
	}
	
	public HashMap<Object,Object> getMemPenaltyInfo(int memberPenaltyId){
		return accountManageDao.getMemPenaltyInfo(memberPenaltyId);
	}
	
	public List<HashMap<Object,Object>> getMemPeUpdate(int page,int memberPenaltyId){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return accountManageDao.getMemPeUpdate(memberPenaltyId,rowBounds);
	}
	
	public PageBean getMemPeUpdateCnt(int page,int memberPenaltyId) {
		int shopCnt = accountManageDao.getMemPeUpdateCnt(memberPenaltyId);
		PageBean pageBean = new PageBean(page,shopCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public int getMemPeUpdateRealCnt(int memberPenaltyId) {
		int shopCnt = accountManageDao.getMemPeUpdateCnt(memberPenaltyId);
		return shopCnt;
	}
	
	public void updateMemPenalty(HashMap<Object,Object> map) {
		
		accountManageDao.updateMemPenalty(map);
		accountManageDao.addMemPenaltyList(map);
	}
	
	public HashMap<Object,Object> getShopPenaltyInfo(int shopPenaltyId){
		return accountManageDao.getShopPenaltyInfo(shopPenaltyId);
	}
	
	public List<HashMap<Object,Object>> getShopPeUpdate(int page,int shopPenaltyId){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return accountManageDao.getShopPeUpdate(shopPenaltyId,rowBounds);
	}
	
	public PageBean getShopPeUpdateCnt(int page,int shopPenaltyId) {
		int shopCnt = accountManageDao.getShopPeUpdateCnt(shopPenaltyId);
		PageBean pageBean = new PageBean(page,shopCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public int getShopPeUpdateRealCnt(int shopPenaltyId) {
		int shopCnt = accountManageDao.getShopPeUpdateCnt(shopPenaltyId);
		return shopCnt;
	}
	
	public void updateShopPenalty(HashMap<Object,Object> map) {
		
		accountManageDao.updateShopPenalty(map);
		accountManageDao.addShopPenaltyList(map);
		
	}
	
	
}
