package kr.ac.kopo.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Reservation {
	
	private Room room;
	private RoomOption roomOption;
	private ServiceOption serviceOption;
	private WorkationOption workationOption;
	private Member member;
	
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public RoomOption getRoomOption() {
		return roomOption;
	}
	public void setRoomOption(RoomOption roomOption) {
		this.roomOption = roomOption;
	}
	public ServiceOption getServiceOption() {
		return serviceOption;
	}
	public void setServiceOption(ServiceOption serviceOption) {
		this.serviceOption = serviceOption;
	}
	public WorkationOption getWorkationOption() {
		return workationOption;
	}
	public void setWorkationOption(WorkationOption workationOption) {
		this.workationOption = workationOption;
	}
	private int reservationId;
	private int roomId;
	private int roomOptionId;
	private int serviceOptionId;
	private int workationOptionId;
	private String memberId;
	private int totalPay;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reserveDate;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	 @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date checkIn;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	 @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date checkOut;
	public int getReservationId() {
		return reservationId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public int getRoomOptionId() {
		return roomOptionId;
	}
	public void setRoomOptionId(int roomOptionId) {
		this.roomOptionId = roomOptionId;
	}
	public int getServiceOptionId() {
		return serviceOptionId;
	}
	public void setServiceOptionId(int serviceOptionId) {
		this.serviceOptionId = serviceOptionId;
	}
	public int getWorkationOptionId() {
		return workationOptionId;
	}
	public void setWorkationOptionId(int workationOptionId) {
		this.workationOptionId = workationOptionId;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getTotalPay() {
		return totalPay;
	}
	public void setTotalPay(int totalPay) {
		this.totalPay = totalPay;
	}
	public Date getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}
	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}
	 
	 
	 
}
