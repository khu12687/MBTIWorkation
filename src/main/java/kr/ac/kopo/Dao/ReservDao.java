package kr.ac.kopo.Dao;

import kr.ac.kopo.model.Reservation;
import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;
import kr.ac.kopo.model.WorkationOption;

public interface ReservDao {

	void reserv(Reservation reservation);

	RoomOption getRoomOptionId(RoomOption roomOption);

	ServiceOption getServiceOptionId(ServiceOption serviceOption);

	WorkationOption getWorkationOptionId(WorkationOption workationOption);

	int getReservationId(int reservationId);

	Reservation getReservationInfo(int reservationId);

	Reservation del(int reservationId);

}
