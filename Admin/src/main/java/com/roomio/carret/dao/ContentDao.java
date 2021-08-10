package com.roomio.carret.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.roomio.carret.bean.WordSearchBean;

@Repository
public class ContentDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int addProWord(HashMap<Object,Object> map) {
		return sqlSessionTemplate.insert("com.roomio.carret.content.addProWord",map);
	}
	
	public List<HashMap<Object,Object>> getProWord(WordSearchBean bean,RowBounds rowBounds){
		return sqlSessionTemplate.selectList("com.roomio.carret.content.getProWord",bean,rowBounds);
	}
	
	public int getProWordCnt(WordSearchBean bean) {
		return sqlSessionTemplate.selectOne("com.roomio.carret.content.getProWordCnt",bean);
	}
	
	public int deleteProword(int id) {
		return sqlSessionTemplate.delete("com.roomio.carret.content.deleteProword",id);
	}
	
	public int deleteAllProword(List<Integer> list) {
		return sqlSessionTemplate.delete("com.roomio.carret.content.deleteAllProword",list);
	}
	
	public HashMap<Object,Object> getNewsInfo(int id){
		return sqlSessionTemplate.selectOne("com.roomio.carret.content.getNewsInfo",id);
	}
	
	public List<HashMap<Object,Object>> getNewsUpdateList(int id){
		return sqlSessionTemplate.selectList("com.roomio.carret.content.getNewsUpdateList",id);
	}
}
