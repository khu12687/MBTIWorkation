package model;

public class Room {
	private int room_id;
	private String max_number;
	private String room_size;
	private String filename;
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getMax_number() {
		return max_number;
	}
	public void setMax_number(String max_number) {
		this.max_number = max_number;
	}
	public String getRoom_size() {
		return room_size;
	}
	public void setRoom_size(String room_size) {
		this.room_size = room_size;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
}
