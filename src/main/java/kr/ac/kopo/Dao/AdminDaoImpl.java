package kr.ac.kopo.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.exception.DataNotFoundException;
import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;
import kr.ac.kopo.model.WorkationOption;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	SqlSession sql;
	
	@Override
	public Admin loginCheck(Admin admin) {
		Admin obj=sql.selectOne("Admin.loginCheck", admin);
		if(obj==null) {
			System.out.println("오류발생");
			throw new DataNotFoundException("로그인 정보가 올바르지 않습니다");
			
		}
		return obj;
		
	}

	@Override
	public void roomOptionRegist(RoomOption roomOption) {
		sql.insert("Admin.roomOptionRegist",roomOption);
	}

	@Override
	public List<RoomOption> roomOptionList() {

		return sql.selectList("Admin.roomOptionList");
	}

	@Override
	public void delete(int roomOptionId) {
		sql.selectOne("Admin.delete",roomOptionId);
	}

	@Override
	public void edit(RoomOption roomOption) {
		sql.selectOne("Admin.edit", roomOption);
	}

	@Override
	public void serviceOptionRegist(ServiceOption serviceOption) {
		sql.insert("Admin.serviceOptionRegist",serviceOption);
	}

	@Override
	public void deleteServiceOption(int serviceOptionId) {
		sql.selectOne("Admin.deleteServiceOption",serviceOptionId);
	}

	@Override
	public void editService(ServiceOption serviceOption) {
		sql.selectOne("Admin.editService", serviceOption);
	}

	@Override
	public List<ServiceOption> serviceOptionList() {
	
		return sql.selectList("Admin.serviceOptionList");
	}

	@Override
	public void roomRegist(Room room) {
		sql.insert("Admin.roomRegist",room);
	}

	@Override
	public List<Room> roomList() {

		return sql.selectList("Admin.roomList");
	}

	@Override
	public void deleteRoom(int roomId) {
		sql.selectOne("Admin.deleteRoom",roomId);
	}

	@Override
	public void roomEdit(Room room) {
		sql.selectOne("Admin.roomEdit", room);
	}

	@Override
	public void workationOptionRegist(WorkationOption workationOption) {
		sql.insert("Admin.workationOptionRegist",workationOption);
	}

	@Override
	public List<WorkationOption> workationOptionList() {
		
		return sql.selectList("Admin.workationOptionList");
	}

	@Override
	public void deleteworkationOption(int workationOptionId) {
		sql.selectOne("Admin.deleteWorkationOption",workationOptionId);
	}

	@Override
	public void workationOptionEdit(WorkationOption workationOption) {
		sql.selectOne("Admin.workationOptionEdit", workationOption);
	}

}
