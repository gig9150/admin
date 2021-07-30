package com.roomio.carret.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.roomio.carret.service.ContentService;

@Controller
public class ContentController {

	@Autowired
	private ContentService contentService;
	
	@RequestMapping("/content/prohibited_word")
	public String prohibitedWord() {
		
		return "content/prohibited_word";
		
	}
	
	@RequestMapping("/content/word_register")
	public String wordRegister() {
		
		return "content/word_register";
		
	}
}
