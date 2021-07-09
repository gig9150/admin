package com.roomio.carret.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OperationDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
