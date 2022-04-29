package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import kr.ac.kopo.model.Member;
import kr.ac.kopo.model.Reservation;
import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;
import kr.ac.kopo.model.WorkationOption;
import kr.ac.kopo.service.AdminService;
import kr.ac.kopo.service.ReservService;
@Controller
public class WorkationController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	ReservService reservService;
	
	final String path = "/reserv/";
	
	@GetMapping("/reserv/{roomId}")
	public String reserv(@PathVariable int roomId, Model model) {
		
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
	
	@PostMapping("/reserv/{roomId}")
	public String reserv(@PathVariable int roomId, Reservation reservation, RoomOption roomOption, ServiceOption serviceOption, WorkationOption workationOption, Model model) {
		System.out.println(roomOption.getRoomType());
		model.addAttribute("reservation",reservation);
		return path + "step2";
	}
	
	@PostMapping("/reserv/{roomId}/step2")
	public String step2(@PathVariable int roomId, Reservation reservation, RoomOption roomOption ,ServiceOption serviceOption, WorkationOption workationOption, Model model,@SessionAttribute Member member) {
		
		RoomOption objRoomOption = reservService.getRoomOptionId(roomOption);
		reservation.setRoomOptionId(objRoomOption.getRoomOptionId());
		
		System.out.println(serviceOption.getServiceName());
		ServiceOption objServiceOption = reservService.getServiceOptionId(serviceOption);
		System.out.println(objServiceOption.getServiceOptionId());
		reservation.setServiceOptionId(objServiceOption.getServiceOptionId());
		
		WorkationOption objWorkationOption = reservService.getWorkationOptionId(workationOption);
		reservation.setWorkationOptionId(objWorkationOption.getWorkationOptionId());
		
		reservation.setRoomId(roomId);
		reservation.setMemberId(member.getId());
		
		
		reservService.reserv(reservation);
		List<Reservation> reservList = reservService.getReservationId(member.getId());
		reservation.setReservationId(reservList.get(reservList.size()-1).getReservationId()) ;
		model.addAttribute("reservation",reservation);
		System.out.println(reservation.getTotalPay());
		
		return path + "step3";
	}
	
	@GetMapping("/reserv/check")
	public String check() {
		
		return path + "check";
	}
	
	@PostMapping("/reserv/check")
	@ResponseBody
	public Reservation check(@RequestBody Reservation reservation){
		System.out.println(reservation.getReservationId());
		Reservation objReser = reservService.getReservationInfo(reservation.getReservationId());
		System.out.println(objReser.getServiceOption().getServiceName());
		return objReser;
	}
	
	@PostMapping("/reserv/del")
	@ResponseBody
	public String del(@RequestBody Reservation reservation){
		reservService.del(reservation.getReservationId());
		return "1";
	}
}
