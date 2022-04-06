package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	final String path = "/admin/";
	
	@RequestMapping("/admin")
	public String admin() {
		
		return path + "index";
	}
}
