package model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Reservation {
	private int reservation_id;
	private int member_id;
	private int room_id;
	private int category_option_id;
	private int total_pay;
	private Date reserve_date;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date check_in;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date check_out;
	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public int getCategory_option_id() {
		return category_option_id;
	}
	public void setCategory_option_id(int category_option_id) {
		this.category_option_id = category_option_id;
	}
	public int getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(int total_pay) {
		this.total_pay = total_pay;
	}
	public Date getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}
	public Date getCheck_in() {
		return check_in;
	}
	public void setCheck_in(Date check_in) {
		this.check_in = check_in;
	}
	public Date getCheck_out() {
		return check_out;
	}
	public void setCheck_out(Date check_out) {
		this.check_out = check_out;
	}

	
	
}
