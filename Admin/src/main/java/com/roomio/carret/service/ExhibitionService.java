package com.roomio.carret.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.roomio.carret.bean.CurationRegisterBean;
import com.roomio.carret.bean.CurationSearchBean;
import com.roomio.carret.bean.PageBean;
import com.roomio.carret.bean.ShopSearchBean;
import com.roomio.carret.dao.ExhibitionDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ExhibitionService {
	
	@Value("${page.listCut}")
	private int listCnt;
	
	@Value("${page.paginationCnt}")
	private int paginationCnt;
	
	@Value("${path.upload}")
	private String pathUpload;

	@Autowired
	private ExhibitionDao exhibitionDao;
	
	public PageBean getCurationCnt(int page,CurationSearchBean curationSearchBean) {
		int roleGroupsCnt = exhibitionDao.getCurationCnt(curationSearchBean);
		PageBean pageBean = new PageBean(page,roleGroupsCnt,listCnt,paginationCnt);
		return pageBean;
	}
	
	public int getCurationRealCnt(int page,CurationSearchBean curationSearchBean) {
		int roleGroupsCnt = exhibitionDao.getCurationCnt(curationSearchBean);
		return roleGroupsCnt;
	}
	
	
	public List<HashMap<Object,Object>> getCurationList(int page,CurationSearchBean curationSearchBean){
		int start = (page - 1) * listCnt;
		RowBounds rowBounds = new RowBounds(start,listCnt);
		return exhibitionDao.getCurationList(curationSearchBean,rowBounds);
	}
	
	public boolean checkUrlExist(String url) {
		String urlChk = exhibitionDao.checkUrlExist(url);
		if(urlChk != null) {
			return false;
		}else {
			return true;
		}
	}
	
	private String saveUploadFile(MultipartFile upload_file) {

		String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();

		try {
			upload_file.transferTo(new File(pathUpload + file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return file_name;
	}
	
	public void addNewCuration(CurationRegisterBean curationRegisterBean,
								List<Integer> shopIdx) {
		
		//파일 업로드 객체 생성 및 bean에 파일 이름 저장 
		
		MultipartFile uploadFile = curationRegisterBean.getUploadFile();
		
		if(uploadFile != null && uploadFile.getSize() > 0) {
			
			String fileName = saveUploadFile(uploadFile);
			curationRegisterBean.setBannerImage(fileName);

		}
		
		// 기획전 등록 
		exhibitionDao.addNewCuration(curationRegisterBean);
		
		
		if(shopIdx != null) {
			
			// insert된 기획전 키값 얻어오기
			int shopExhiId = curationRegisterBean.getFranchiseId();
			
			List<HashMap<Object,Object>> curationList = new ArrayList<HashMap<Object,Object>>();
			HashMap<Object,Object> curationMap = new HashMap<Object,Object>();
			
			curationMap.put("shopExhiId",shopExhiId);
			
			for(int i=0;i<shopIdx.size();i++) {
				
				curationMap.put("shopIdx",shopIdx.get(i));
				curationList.add(curationMap);
				
			}
			
			//기획전 상품 등록 
			
			exhibitionDao.addCurationShop(curationList);
			
		}

	}
	
	public HashMap<Object,Object> getExhibition(int shopExhiId){
		
		return exhibitionDao.getExhibition(shopExhiId);
		
	}
	
	public void updateCuration(CurationRegisterBean curationRegisterBean,
								List<Integer> shopIdx) {
		
		//파일 업로드 객체 생성 및 bean에 파일 이름 저장 
		
		MultipartFile uploadFile = curationRegisterBean.getUploadFile();
		
		if(uploadFile != null && uploadFile.getSize() > 0) {
			
			String fileName = saveUploadFile(uploadFile);
			curationRegisterBean.setBannerImage(fileName);
	
		}
		
		exhibitionDao.updateCuration(curationRegisterBean);
		
		if(shopIdx != null) {

			int shopExhiId = curationRegisterBean.getShopExhiId();
			
			//기획전 전리품 삭제
			exhibitionDao.deleteCuration(shopExhiId);
			
			List<HashMap<Object,Object>> curationList = new ArrayList<HashMap<Object,Object>>();
			HashMap<Object,Object> curationMap = new HashMap<Object,Object>();
			
			curationMap.put("shopExhiId",shopExhiId);
			
			for(int i=0;i<shopIdx.size();i++) {
				
				curationMap.put("shopIdx",shopIdx.get(i));
				curationList.add(curationMap);
				
			}
			
			//기획전 상품 등록 
			
			exhibitionDao.addCurationShop(curationList);
			
		}
		
		
	}
	
}
