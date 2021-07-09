package com.roomio.carret.controller;

import java.io.File;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@PropertySource("/WEB-INF/properties/option.properties")
public class CommonController {
	
	@Value("${path.upload}")
	private String pathUpload;

	@RequestMapping("/notice/download")
	public ModelAndView download(@RequestParam HashMap<Object, Object> params, ModelAndView mv) {
		String fileName = (String) params.get("fileName");
		String oriFileName = (String)params.get("oriFileName");
		String fullPath = pathUpload + fileName;
		File file = new File(fullPath);
		
		mv.setViewName("downloadView");
		mv.addObject("oriFileName",oriFileName);
		mv.addObject("downloadFile", file);
		return mv;
		
	}
}
