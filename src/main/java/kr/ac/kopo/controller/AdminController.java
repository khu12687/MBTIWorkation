package kr.ac.kopo.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.exception.DMLException;
import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.LogLogin;
import kr.ac.kopo.model.Member;
import kr.ac.kopo.model.Workation;
import kr.ac.kopo.model.ProductImage;
import kr.ac.kopo.model.Reservation;
import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;
import kr.ac.kopo.model.WorkationOption;
import kr.ac.kopo.service.AdminService;
import kr.ac.kopo.service.MemberService;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.util.Uploader;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	final String path = "/admin/";
	
	@Autowired
	AdminService service;
	
	@Autowired
	MemberService memberService;
	
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
	
	@GetMapping("/memberInfo")
	public String memberInfo(Model model, Pager pager) {
		List<Member> members = memberService.selectAll(pager);
		model.addAttribute("list",members);
		
		return path + "memberInfo";
	}
	
	@GetMapping("/reservInfo")
	public String reservInfo(Model model, Pager pager) {
		List<Reservation> list = service.selectReservAll(pager);
		model.addAttribute("list", list);
		
		return path + "reservInfo";
	}
	
	//PathVariable 사용시 .com이 날라가서 뒤에 / 을 추가
	@GetMapping("/log/{memberId}/")
	public String log(@PathVariable String memberId, Model model) {
			
		List<LogLogin> list =  memberService.log(memberId);
		model.addAttribute("list",list);
		return path + "log";
	}
	
	@GetMapping("/product")
	public String product(Model model) {
		List<RoomOption> roomOptionList = service.roomOptionList();
		model.addAttribute("roomOptionList",roomOptionList);
		List<ServiceOption> serviceOptionList = service.serviceOptionList();
		model.addAttribute("serviceOptionList",serviceOptionList);
		List<Room> roomList = service.roomList();
		model.addAttribute("roomList",roomList);
		List<WorkationOption> workationOptionList = service.workationOptionList();
		model.addAttribute("workationOptionList",workationOptionList);
		
		List<Workation> workationList = service.getWorkationProduct();
		model.addAttribute("workationList",workationList);
		
		return path + "product";
	}
	
	@GetMapping("/product/{workationId}")
	@ResponseBody
	public Workation product(@PathVariable int workationId) {
		Workation item = service.getWorkationItem(workationId);
		
		return item;
	}
	
	@GetMapping("/category")
	public String category() {
		
		return path + "category";
	}
	
	@PostMapping("/roomOption/regist")
	@ResponseBody
	public RoomOption roomOptionRegist(@RequestBody RoomOption roomOption) {
		System.out.println(roomOption.getMaxNumber());
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

	@PostMapping("/addImg")
	public String add(Room item, @RequestParam("productImg") List<MultipartFile> productImg) {
		System.out.println(item.getRoomId());
		try {
			Uploader<ProductImage> uploader = new Uploader<>();
			
			List<ProductImage> images = uploader.makeList(productImg, ProductImage.class);
			
			item.setImages(images);
			service.addImg(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return path + "imgManage";
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
	
	@PostMapping("/room/regist")
	@ResponseBody
	public Room roomOption(@RequestBody Room room) {
		System.out.println(room.getLatitude());
		System.out.println(room.getLongitude());
		service.roomRegist(room);
		
		return room;
	}
	
	@GetMapping("/room/list")
	@ResponseBody
	public List<Room> roomList(){
		
		List<Room> list = service.roomListajax();
		
		return list;
	}
	
	@GetMapping("/room/item/{roomId}")
	@ResponseBody
	public Room roomItem(@PathVariable int roomId) {
		Room item = service.roomItem(roomId);
		
		return item;
	}
	
	@GetMapping("/room/del/{roomId}")
	@ResponseBody
	public String roomDel(@PathVariable int roomId) {
		service.deleteRoom(roomId);
		
		return "1";
	}
	
	@PostMapping("/room/edit/{roomId}")
	@ResponseBody
	public String roomEdit(@PathVariable int roomId, @RequestBody Room room) {
		room.setRoomId(roomId);
		service.roomEdit(room);
		
		return "1";
	}
	
	@PostMapping("/workationOption/regist")
	@ResponseBody
	public WorkationOption workationOption(@RequestBody WorkationOption workationOption) {
		service.workationOptionRegist(workationOption);
		
		return workationOption;
	}
	
	@GetMapping("/workationOption/list")
	@ResponseBody
	public List<WorkationOption> workationOptionList(){
		
		List<WorkationOption> list = service.workationOptionList();
		
		return list;
	}
	
	@GetMapping("/workationOption/del/{workationOptionId}")
	@ResponseBody
	public String workationOptionDel(@PathVariable int workationOptionId) {
		service.deleteworkationOption(workationOptionId);
		
		return "1";
	}
	
	@PostMapping("/workationOption/edit/{workationOptionId}")
	@ResponseBody
	public String workationOptionEdit(@PathVariable int workationOptionId, @RequestBody WorkationOption workationOption) {
		workationOption.setWorkationOptionId(workationOptionId);
		service.workationOptionEdit(workationOption);
		
		return "1";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:../";
	}
	
	@GetMapping("/imgManage")
	public String imgManage() {
		
		
		return path + "imgManage";
	}
	
	@PostMapping("/excelUpload")
	public String excelUpload(@RequestParam("excelFile") MultipartFile excelFile) {
		//System.out.println(excelFile.getOriginalFilename());
		String path = "/D:/uploadExcel/";
		File file = new File(path);
		if(!file.exists()) {
			file.mkdir();
		}
		File destFile = new File(path+excelFile.getOriginalFilename());
		try {
			excelFile.transferTo(destFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		System.out.println(destFile);
		service.excelUpload(destFile);
		//destFile.delete();
		
		return "redirect:imgManage";
	}
	
	@PostMapping("/addProduct")
	@ResponseBody
	public String addProduct(@RequestBody Workation obj) {
		service.addProduct(obj);
		
		return "1";
	}
	
	@ExceptionHandler(DMLException.class)
	@ResponseBody
	public String handle(DMLException e) {
		
		return "0";
	}
	
}
