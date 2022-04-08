package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.AdminDao;
import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao dao;
	
	@Override
	public Admin loginCheck(Admin admin) {
		return dao.loginCheck(admin);
		
	}

	@Override
	public void roomOptionRegist(RoomOption roomOption) {
		dao.roomOptionRegist(roomOption);
	}

	@Override
	public List<RoomOption> roomOptionList() {
		
		return dao.roomOptionList();
	}

	@Override
	public void delete(int roomOptionId) {
		dao.delete(roomOptionId);

	}

	@Override
	public void edit(RoomOption roomOption) {
		dao.edit(roomOption);
		
	}

	@Override
	public void serviceOptionRegist(ServiceOption serviceOption) {
		dao.serviceOptionRegist(serviceOption);
	}

	@Override
	public void deleteServiceOption(int serviceOptionId) {
		dao.deleteServiceOption(serviceOptionId);
	}

	@Override
	public void editService(ServiceOption serviceOption) {
		dao.editService(serviceOption);
	}

	@Override
	public List<ServiceOption> serviceOptionList() {

		return dao.serviceOptionList();
	}

}
