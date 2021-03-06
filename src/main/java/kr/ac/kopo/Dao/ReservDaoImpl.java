package kr.ac.kopo.Dao;

import java.util.List;

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
	public List<Reservation> getReservationId(String memberId) {

		return sql.selectList("reserv.getReservationId", memberId);
	}

	@Override
	public Reservation getReservationInfo(int reservationId) {
		System.out.println(reservationId);
		return sql.selectOne("reserv.getReservationInfo", reservationId);
	}

	@Override
	public Reservation del(int reservationId) {

		return sql.selectOne("reserv.del",reservationId);
	}

	@Override
	public List<Reservation> getReservNumber(String phone) {

		return sql.selectList("getReservNumber",phone);
	}

}
