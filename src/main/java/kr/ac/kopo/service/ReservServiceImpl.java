package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.ReservDao;
import kr.ac.kopo.model.Reservation;
import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;
import kr.ac.kopo.model.WorkationOption;

@Service
public class ReservServiceImpl implements ReservService{

	@Autowired
	ReservDao reservDao;
	
	@Override
	public void reserv(Reservation reservation) {
		reservDao.reserv(reservation);
	}

	@Override
	public RoomOption getRoomOptionId(RoomOption roomOption) {
		return reservDao.getRoomOptionId(roomOption);
	}

	@Override
	public ServiceOption getServiceOptionId(ServiceOption serviceOption) {
		return reservDao.getServiceOptionId(serviceOption);
	}

	@Override
	public WorkationOption getWorkationOptionId(WorkationOption workationOption) {
		return reservDao.getWorkationOptionId(workationOption);
	}

	@Override
	public List<Reservation> getReservationId(String memberId) {
		
		return reservDao.getReservationId(memberId);
	}

	@Override
	public Reservation getReservationInfo(int reservationId) {

		return reservDao.getReservationInfo(reservationId);
	}

	@Override
	public Reservation del(int reservationId) {
		
		return reservDao.del(reservationId);
	}

	@Override
	public List<Reservation> getReservNumber(String phone) {

		return reservDao.getReservNumber(phone);
	}
}
