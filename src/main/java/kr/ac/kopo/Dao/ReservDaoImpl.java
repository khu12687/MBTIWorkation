package kr.ac.kopo.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Reservation;
import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;
import kr.ac.kopo.model.WorkationOption;

@Repository
public class ReservDaoImpl implements ReservDao{

	@Autowired
	SqlSession sql;
	
	@Override
	public void reserv(Reservation reservation) {
		sql.insert("reserv.insert",reservation);
	}

	@Override
	public Room getRoomId(Room room) {
		return sql.selectOne("reserv.getRoomId",room);
	}

	@Override
	public RoomOption getRoomOptionId(RoomOption roomOption) {
		return sql.selectOne("reserv.getRoomOptionId",roomOption);
	}

	@Override
	public ServiceOption getServiceOptionId(ServiceOption serviceOption) {
		return sql.selectOne("reserv.getServiceOptionId",serviceOption);
	}

	@Override
	public WorkationOption getWorkationOptionId(WorkationOption workationOption) {
		return sql.selectOne("reserv.getWorkationOptionId",workationOption);
	}

	@Override
	public int getReservationId(int phone) {

		return sql.selectOne("reserv.getReservationId", phone);
	}

	@Override
	public Reservation getReservationInfo(int reservationId) {

		return sql.selectOne("reserv.getReservationInfo", reservationId);
	}

}
