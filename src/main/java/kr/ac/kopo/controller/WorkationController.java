package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.kopo.model.Reservation;
import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.Room_option;
import kr.ac.kopo.model.Service_option;
import kr.ac.kopo.model.Subscr;
import kr.ac.kopo.model.Workation_option;
@Controller
public class WorkationController {
	
	final String path = "/reserv/";
	
	@GetMapping("/reserv/{workation_id}")
	public String reserv(@PathVariable int workation_id) {
		
		return path + "step1";
	}
	
	@PostMapping("/reserv/{workation_id}")
	public String reserv(@PathVariable int workation_id, Reservation reservation, Room_option room_option ,Room room, Service_option service_option, Workation_option workation_option, Model model) {
		
		model.addAttribute("reservation",reservation);
		System.out.println(reservation.getCheck_in());
		return path + "step2";
	}
	
	@PostMapping("/reserv/{workation_id}/step2")
	public String step2(@PathVariable int workation_id, Reservation reservation, Room_option room_option ,Room room, Service_option service_option, Workation_option workation_option, Subscr subscr) {
		System.out.println(workation_id);
		System.out.println(reservation.getCheck_in());
		
		return path + "step3";
	}
}
