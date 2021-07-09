package com.roomio.carret.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.roomio.carret.dao.OperationDao;

@Service
public class OperationService {

	@Autowired
	private OperationDao operationDao;
	
}
