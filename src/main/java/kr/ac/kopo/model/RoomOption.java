package kr.ac.kopo.model;

import java.util.List;

public class RoomOption {
	private int roomOptionId;
	private String roomType;
	private int price;
	private String detail;
	private String maxNumber;

	public String getMaxNumber() {
		return maxNumber;
	}
	public void setMaxNumber(String maxNumber) {
		this.maxNumber = maxNumber;
	}
	public int getRoomOptionId() {
		return roomOptionId;
	}
	public void setRoomOptionId(int roomOptionId) {
		this.roomOptionId = roomOptionId;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}

	
}
