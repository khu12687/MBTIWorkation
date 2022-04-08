package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.exception.DMLException;
import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.CategoryOption;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;
import kr.ac.kopo.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	final String path = "/admin/";
	
	@Autowired
	AdminService service;
	
	@GetMapping("/index")
	public String index(@SessionAttribute Admin admin) {
		
		return path + "/index";
	}
	
	@GetMapping("/login")
	public String goLogin() {
		
		return path + "login";
	}
	
	@PostMapping("/login")
	public String login(Admin admin, Model model, HttpSession session) {
		Admin obj = service.loginCheck(admin);
		session.setAttribute("admin", obj);
		model.addAttribute("msg", obj.getName()+"님 안녕하세요");
		model.addAttribute("url", "/admin/index");
		
		return "message";
	}
	
	@GetMapping("/category")
	public String category() {
		
		return path + "category";
	}
	
	@PostMapping("/roomOption/regist")
	@ResponseBody
	public RoomOption roomOptionRegist(@RequestBody RoomOption roomOption) {
		service.roomOptionRegist(roomOption);
		
		return roomOption;
	}
	
	@GetMapping("/roomOption/list")
	@ResponseBody
	public List<RoomOption> roomOptionList(){
		
		List<RoomOption> list = service.roomOptionList();
		
		return list;
	}
	
	@GetMapping("/roomOption/del/{roomOptionId}")
	@ResponseBody
	public String roomOptionDel(@PathVariable int roomOptionId) {
		service.delete(roomOptionId);
		
		return "1";
	}
	
	@PostMapping("/roomOption/edit/{roomOptionId}")
	@ResponseBody
	public String roomOptionEdit(@PathVariable int roomOptionId, @RequestBody RoomOption roomOption) {
		roomOption.setRoomOptionId(roomOptionId);
		service.edit(roomOption);
		
		return "1";
	}

	@PostMapping("/serviceOption/regist")
	@ResponseBody
	public ServiceOption serviceOptionRegist(@RequestBody ServiceOption serviceOption) {
		service.serviceOptionRegist(serviceOption);
		
		return serviceOption;
	}
	
	@GetMapping("/serviceOption/list")
	@ResponseBody
	public List<ServiceOption> serviceOptionList(){
		
		List<ServiceOption> list = service.serviceOptionList();
		
		return list;
	}
	
	@GetMapping("/serviceOption/del/{serviceOptionId}")
	@ResponseBody
	public String serviceOptionDel(@PathVariable int serviceOptionId) {
		service.deleteServiceOption(serviceOptionId);
		
		return "1";
	}
	
	@PostMapping("/serviceOption/edit/{serviceOptionId}")
	@ResponseBody
	public String serviceOptionEdit(@PathVariable int serviceOptionId, @RequestBody ServiceOption serviceOption) {
		serviceOption.setServiceOptionId(serviceOptionId);
		service.editService(serviceOption);
		
		return "1";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:../";
	}
	
	@ExceptionHandler(DMLException.class)
	@ResponseBody
	public String handle(DMLException e) {
		
		return "0";
	}
	
}
