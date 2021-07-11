package com.roomio.carret.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roomio.carret.service.OperationService;

@Controller
public class OperationController {

	@Autowired
	private OperationService operationService;
	
	//1:1문의 게시판
	
	@RequestMapping("/operation/question")
	public String question() {
		
		
		return "operation/question";
	}
	
	//1:1문의 답변 게시판
	@RequestMapping("/operation/question_register")
	public String question_register(@RequestParam String questionId,
									Model model) {
		
		return "operation/question_register";
	}
	
	
}
