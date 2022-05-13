package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.Workation;
import kr.ac.kopo.service.AdminService;
import kr.ac.kopo.util.Pager;

@Controller
public class rootController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping("/")
	public String index(Room room, Model model) {
		
		List<Room> roomList =  service.roomList();
		model.addAttribute("roomList",roomList);
		
		List<Workation> workationList = service.getWorkationProduct();
		model.addAttribute("workationList", workationList);
		System.out.println(workationList.get(0).getMbtiId());
		return "index";
	}
}
