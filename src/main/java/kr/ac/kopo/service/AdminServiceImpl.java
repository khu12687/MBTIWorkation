package kr.ac.kopo.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.AdminDao;
import kr.ac.kopo.Dao.ProductImageDao;
import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.ProductImage;
import kr.ac.kopo.model.Reservation;
import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;
import kr.ac.kopo.model.WorkationOption;
import kr.ac.kopo.util.ExcelReadOption;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.util.excelRead;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao dao;
	
	@Autowired
	ProductImageDao productImageDao;
	
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

	@Override
	public void roomRegist(Room room) {
		dao.roomRegist(room);
	}

	@Override
	public List<Room> roomList() {

		return dao.roomList();
	}

	@Override
	public void deleteRoom(int roomId) {
		dao.deleteRoom(roomId);
	}

	@Override
	public void roomEdit(Room room) {
		dao.roomEdit(room);
	}

	@Override
	public void workationOptionRegist(WorkationOption workationOption) {
		dao.workationOptionRegist(workationOption);
	}

	@Override
	public List<WorkationOption> workationOptionList() {
		
		return dao.workationOptionList();
	}

	@Override
	public void deleteworkationOption(int workationOptionId) {
		dao.deleteworkationOption(workationOptionId);
		
	}

	@Override
	public void workationOptionEdit(WorkationOption workationOption) {
		dao.workationOptionEdit(workationOption);
	}

	@Override
	public List<Room> roomList(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		return dao.roomList(pager);
	}

	@Override
	public void addImg(Room item) {

		if(item.getImages() != null)
			for(ProductImage image : item.getImages()) {
				image.setRoomId(item.getRoomId());
				System.out.println(image.getRoomId());
				productImageDao.add(image);
			}
	}

	@Override
	public List<Room> roomListajax() {
		
		return dao.roomListajax();
	}

	@Override
	public void excelUpload(File destFile) {
		ExcelReadOption excelReadOption = new ExcelReadOption();
		
		//파일경로 추가
		excelReadOption.setFilePath(destFile.getAbsolutePath());
		
		//추출할 컬럼명 추가
		excelReadOption.setOutputColumns("loc","content","price","latitude","longitude");
		
		//시작행
		excelReadOption.setStartRow(2);
		
		List<Map<String,String>>excelContent = excelRead.read(excelReadOption);
		System.out.println(excelContent.get(0).get("A"));
		Map<String, Object>paramMap = new HashMap<String, Object>();
		paramMap.put("excelContent", excelContent);
		
		dao.excelUpload(paramMap);
		
		
	}

	@Override
	public List<Reservation> selectReservAll(Pager pager) {

		return dao.selectReservAll(pager);
	}

	@Override
	public Room roomItem(int roomId) {

		return dao.roomItem(roomId);
	}

}
