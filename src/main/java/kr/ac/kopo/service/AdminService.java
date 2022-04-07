package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.RoomOption;

public interface AdminService {

	Admin loginCheck(Admin admin);

	void roomOptionRegist(RoomOption roomOption);

	List<RoomOption> roomOptionList();

	void delete(int roomOptionId);

	void edit(RoomOption roomOption);

}
