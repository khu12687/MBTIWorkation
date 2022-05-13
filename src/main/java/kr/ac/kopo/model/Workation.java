package kr.ac.kopo.model;

import java.util.List;

public class Workation {
	private int workationId;
	private int roomId;
	private String roomType;
	private String serviceName;
	private String workationName;
	private String productName;
	private String productExplanation;
	private int mbtiId;
	
	public int getMbtiId() {
		return mbtiId;
	}
	public void setMbtiId(int mbtiId) {
		this.mbtiId = mbtiId;
	}
	private Room room;
	private List<ProductImage> images;
	
	public List<ProductImage> getImages() {
		return images;
	}
	public void setImages(List<ProductImage> images) {
		this.images = images;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getWorkationId() {
		return workationId;
	}
	public void setWorkationId(int workationId) {
		this.workationId = workationId;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getWorkationName() {
		return workationName;
	}
	public void setWorkationName(String workationName) {
		this.workationName = workationName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductExplanation() {
		return productExplanation;
	}
	public void setProductExplanation(String productExplanation) {
		this.productExplanation = productExplanation;
	}
	
	
	
}
