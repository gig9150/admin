package com.roomio.carret.controller;

import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.roomio.carret.bean.LoginManagerBean;
import com.roomio.carret.service.ManagerService;

@Controller
public class HomeController { 
	
	@Autowired
	private ManagerService managerService;
	
	@Resource(name = "loginManagerBean")
	@Lazy
	private LoginManagerBean loginManagerBean;

	
	@GetMapping("/")
	public String home(HttpSession session,Locale locale) {
	
		if(loginManagerBean.isIslogin() == true) {
			return "home";
		}else {
			return "redirect:/manager/login";			
		}
		
//		return "redirect:/front/shop/shop_promotion";

	}
	
	@RequestMapping("/endpoint")
	public String endPoint(@RequestParam String p) {
		
		return "end_point";
	}
	
	@GetMapping("/front/home")
	public String goFrontHome() {
		
		return "front/home";
	}
	
	@GetMapping("/error404")
    public String Error404() {

        return "404_page";
        
    }
	
//	@GetMapping("/error500")
//    public String Error500() {
//        return "404_page";
//    }
	
	
}
