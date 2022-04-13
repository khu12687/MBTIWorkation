package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.Reservation;
import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;
import kr.ac.kopo.model.WorkationOption;

public interface AdminService {

	Admin loginCheck(Admin admin);

	void serviceOptionRegist(ServiceOption serviceOption);

	void deleteServiceOption(int serviceOptionId);

	void editService(ServiceOption serviceOption);

	List<ServiceOption> serviceOptionList();

	void roomRegist(Room room);

	List<Room> roomList();

	void deleteRoom(int roomId);

	void roomEdit(Room room);

	void workationOptionRegist(WorkationOption workationOption);

	List<WorkationOption> workationOptionList();

	void deleteworkationOption(int workationOptionId);

	void workationOptionEdit(WorkationOption workationOption);

	void roomOptionRegist(RoomOption roomOption);

	List<RoomOption> roomOptionList();

	void delete(int roomOptionId);

	void edit(RoomOption roomOption);

}
