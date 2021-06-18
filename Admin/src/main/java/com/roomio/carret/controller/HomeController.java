package com.roomio.carret.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@Controller
public class HomeController { 

	
	@GetMapping("/")
	public String home(HttpSession session,Locale locale) {

		
		if(session.getAttribute("id") != null) {
			return "home";
		}else {
			return "redirect:/manager/login";			
		}
		
	}
	
	@GetMapping("/error404")
    public String Error404() {

        return "404_page";
    }
	
	@GetMapping("/error500")
    public String Error500() {
        return "404_page";
    }
	
}
