package com.roomio.carret.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.javassist.compiler.MemberResolver;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.roomio.carret.bean.MemberManageBean;
import com.roomio.carret.bean.MemberPenaltyBean;
import com.roomio.carret.bean.MemberRegisterBean;
import com.roomio.carret.bean.MemberUpdateBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.ShopApplySearchBean;
import com.roomio.carret.dao.MemberDao;


@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class MemberService {
	
	@Value("${page.listCut}")
	private int listCnt;
	
	@Value("${page.paginationCnt}")
	private int paginationCnt;
	
	@Value("${path.upload}")
	private String pathUpload;
	
	
	@Autowired
	private MemberDao memberDao;
	
	//업로드된 파일 이름 얻는 메소드 
	private String saveUploadFile(MultipartFile upload_file) {
		
		String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();
		
		try {
			upload_file.transferTo(new File(pathUpload + file_name));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	
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
	
	public PageBean getMemberPenaltyCnt(int page,MemberPenaltyBean memberPenaltyBean) {
		int roleGroupsCnt = memberDao.getMemberPenaltyCnt(memberPenaltyBean);
		PageBean pageBean = new PageBean(page,roleGroupsCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public List<HashMap<Object,Object>> getMemberPenaltyList(int page,MemberPenaltyBean memberPenaltyBean){
		
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return memberDao.getMemberPenaltyList(memberPenaltyBean,rowBounds);
		
	}
	
	public void addFrontMember(MemberRegisterBean memberRegisterBean) {
		
		if(!memberRegisterBean.getUploadFile().isEmpty()) {
		
			//파일 업로드 객체 생성 및 bean에 파일 이름 저장 
			MultipartFile uploadFile = memberRegisterBean.getUploadFile();
			
			if(uploadFile.getSize() > 0) {
				
				String fileName = saveUploadFile(uploadFile);
				memberRegisterBean.setProfileImage(fileName);
	
			}
			
		}
		
		// 랜덤 코드 생성 
		
		String memberCode = new String();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		    	memberCode += (char) ((int) (rnd.nextInt(26)) + 97);
		        break;
		    case 1:
		        // A-Z
		    	memberCode += (char) ((int) (rnd.nextInt(26)) + 65);
		        break;
		    case 2:
		        // 0-9
		    	memberCode += rnd.nextInt(10);
		        break;
		    }
		}
		
		memberRegisterBean.setMemberCode(memberCode);
		memberDao.addFrontMember(memberRegisterBean);
		
	}
	
	public boolean frontMemberNameChk(String name) {
		
		String checkId =  memberDao.frontMemberNameChk(name);
		if(checkId != null) {
			return true;
		}else {
			return false;
		}
	}
	
	// 회원 닉네임 얻어오기 
	public String frontGetMemberName(String name) {
		
		String checkId =  memberDao.frontMemberNameChk(name);
		return checkId;
	}
	
	// 회원 정보 수정 
	public void frontMemberInfoUpdate(MemberUpdateBean memberUpdateBean) {
		
		if(!memberUpdateBean.getUploadFile().isEmpty()) {
			
			//파일 업로드 객체 생성 및 bean에 파일 이름 저장 
			MultipartFile uploadFile = memberUpdateBean.getUploadFile();
			
			if(uploadFile.getSize() > 0) {
				
				String fileName = saveUploadFile(uploadFile);
				memberUpdateBean.setProfileImage(fileName);
	
			}
			
		}
		
		memberDao.frontMemberInfoUpdate(memberUpdateBean);
		
	}
	

	
	
	
}
