package com.roomio.carret.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.roomio.carret.bean.MemberRegisterBean;
import com.roomio.carret.dao.MypageDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class MypageService {

	@Value("${path.upload}")
	private String pathUpload;

	@Autowired
	private MypageDao mypageDao;

	private String saveUploadFile(MultipartFile upload_file) {

		String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();

		try {
			upload_file.transferTo(new File(pathUpload + file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return file_name;
	}

	public List<HashMap<Object, Object>> getFrontBookmarkShop(int memberId) {
		return mypageDao.getFrontBookmarkShop(memberId);
	}

	public List<HashMap<Object, Object>> getFrontReviewShop(int memberId) {
		return mypageDao.getFrontReviewShop(memberId);
	}

	public List<HashMap<Object, Object>> getFrontMemberQuestion(int memberId) {
		return mypageDao.getFrontMemberQuestion(memberId);
	}

	public List<String> getFrontFrequentQuestionCategory() {
		return mypageDao.getFrontFrequentQuestionCategory();
	}

	public HashMap<Object, Object> getFrontFrequentQuestion(int frequentQuestionId) {
		return mypageDao.getFrontFrequentQuestion(frequentQuestionId);
	}

	public List<HashMap<Object, Object>> getFrontNotice() {
		return mypageDao.getFrontNotice();
	}

	public HashMap<Object, Object> getFrontNoticeDetail(int noticeId) {
		return mypageDao.getFrontNoticeDetail(noticeId);
	}

	public HashMap<Object, Object> getFrontQuestionMemberInfo(int memberId) {
		return mypageDao.getFrontQuestionMemberInfo(memberId);
	}
	
	public List<HashMap<Object,Object>> getFrontQuestionCategory(){
		return mypageDao.getFrontQuestionCategory();
	}

	public void addFrontMemberQuestion(HashMap<Object, Object> questionMap,List<MultipartFile> file) {
		
		// 문의 등록
		mypageDao.addFrontMemberQuestion(questionMap);
		
		// 가장 최근 insert된 문의 키값 얻어오기
		int questionId =  (int)questionMap.get("memberId");
		
		List<HashMap<Object,Object>> imageList = new ArrayList<HashMap<Object,Object>>();
		HashMap<Object,Object> imageMap = new HashMap<Object,Object>();
		
		//map에 insert에 필요한 정보 넣기
		imageMap.put("questionId",questionId);
		if(file != null) {
			for(int i=0;i<file.size();i++) {
				if(!file.get(i).isEmpty() && file.get(i).getSize() > 0) {
					String fileName = saveUploadFile(file.get(i));
					imageMap.put("name",fileName);
					imageList.add(imageMap);
				}
			}
		}
		
		//이미지 등록 
		mypageDao.addFrontMemberQuestionImage(imageList);
		
	}
}
