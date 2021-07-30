package com.roomio.carret.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.roomio.carret.dao.ContentDao;

@Service
public class ContentService {

	@Autowired
	private ContentDao contentDao;
}
