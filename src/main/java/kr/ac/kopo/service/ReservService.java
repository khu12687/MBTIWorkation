package kr.ac.kopo.service;

import kr.ac.kopo.model.Reservation;
import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;
import kr.ac.kopo.model.WorkationOption;

public interface ReservService {

	void reserv(Reservation reservation);

	RoomOption getRoomOptionId(RoomOption roomOption);

	ServiceOption getServiceOptionId(ServiceOption serviceOption);

	WorkationOption getWorkationOptionId(WorkationOption workationOption);

	int getReservationId(int phone);

	Reservation getReservationInfo(int reservationId);

}
