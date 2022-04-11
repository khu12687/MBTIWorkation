package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.kopo.model.Reservation;
import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;
import kr.ac.kopo.model.Subscr;
import kr.ac.kopo.model.WorkationOption;
import kr.ac.kopo.service.AdminService;
@Controller
public class WorkationController {
	
	@Autowired
	AdminService adminService;
	
	final String path = "/reserv/";
	
	@GetMapping("/reserv/{workation_id}")
	public String reserv(@PathVariable int workation_id, Model model) {
		
		List<RoomOption> roomOptionList = adminService.roomOptionList();
		model.addAttribute("roomOptionList",roomOptionList);
		List<ServiceOption> serviceOptionList = adminService.serviceOptionList();
		model.addAttribute("serviceOptionList",serviceOptionList);
		List<Room> roomList = adminService.roomList();
		model.addAttribute("roomList",roomList);
		List<WorkationOption> workationOptionList = adminService.workationOptionList();
		model.addAttribute("workationOptionList",workationOptionList);
		
		return path + "step1";
	}
	
	@PostMapping("/reserv/{workation_id}")
	public String reserv(@PathVariable int workation_id, Reservation reservation, RoomOption roomOption ,Room room, ServiceOption serviceOption, WorkationOption workationOption, Model model) {
		model.addAttribute("reservation",reservation);
		return path + "step2";
	}
	
	@PostMapping("/reserv/{workation_id}/step2")
	public String step2(@PathVariable int workation_id, Reservation reservation, RoomOption roomOption ,Room room, ServiceOption serviceOption, WorkationOption workationOption, Subscr subscr) {
		System.out.println(workation_id);
		System.out.println(reservation.getCheck_in());
		
		return path + "step3";
	}
}
