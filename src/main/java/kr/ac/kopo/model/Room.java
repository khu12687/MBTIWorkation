package kr.ac.kopo.model;

import java.util.List;


public class Room {
	private int roomId;
	private String loc;
	private String maxNumber;
	private int num;
	private int price;
	private List<ProductImage> images;
	
	public List<ProductImage> getImages() {
		return images;
	}
	public void setImages(List<ProductImage> images) {
		this.images = images;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getMaxNumber() {
		return maxNumber;
	}
	public void setMaxNumber(String maxNumber) {
		this.maxNumber = maxNumber;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
