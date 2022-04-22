package kr.ac.kopo.model;

import kr.ac.kopo.util.UploadFile;

public class ProductImage implements UploadFile {
	private int productImgId;
	private String filename;
	private String uuid;
	private int roomId;

	public int getProductImgId() {
		return productImgId;
	}

	public void setProductImgId(int productImgId) {
		this.productImgId = productImgId;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	
}
