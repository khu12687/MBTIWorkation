package kr.ac.kopo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.kopo.model.Reservation;
import kr.ac.kopo.service.AdminService;
import kr.ac.kopo.service.ReservService;

@Controller("/nonMember")
public class NonMemberController {
	
	final String path = "/nonMember/";
	
	@Autowired
	ReservService reservService;
	
	@PostMapping("/getReservationId")
	public String getReservationId(int phone, Model model) {
		
		int rvi = reservService.getReservationId(phone);
		
		model.addAttribute("rvi",rvi);
		
		return path + "index";
	}

	@PostMapping("/reservationInfo")
	public String reservationInfo(int reservationId) {
		
		Reservation reservation = reservService.getReservationInfo(reservationId);
		
		return "";
	}
}
