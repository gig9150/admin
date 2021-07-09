package com.roomio.carret.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.roomio.carret.service.OperationService;

@Controller
public class OperationController {

	@Autowired
	private OperationService operationService;
	
	@RequestMapping("/operation/question")
	public String question() {
		
		
		return "operation/question";
	}
	
}
