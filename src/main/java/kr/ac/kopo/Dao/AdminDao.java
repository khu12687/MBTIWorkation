package kr.ac.kopo.Dao;

import java.util.List;

import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;

public interface AdminDao {

	Admin loginCheck(Admin admin);

	void roomOptionRegist(RoomOption roomOption);

	List<RoomOption> roomOptionList();

	void delete(int roomOptionId);

	void edit(RoomOption roomOption);

	void serviceOptionRegist(ServiceOption serviceOption);

	void deleteServiceOption(int serviceOptionId);

	void editService(ServiceOption serviceOption);

	List<ServiceOption> serviceOptionList();

}
