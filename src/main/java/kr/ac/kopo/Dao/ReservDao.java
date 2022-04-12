package kr.ac.kopo.Dao;

import kr.ac.kopo.model.Reservation;
import kr.ac.kopo.model.Room;
import kr.ac.kopo.model.RoomOption;
import kr.ac.kopo.model.ServiceOption;
import kr.ac.kopo.model.WorkationOption;

public interface ReservDao {

	void reserv(Reservation reservation);

	Room getRoomId(Room room);

	RoomOption getRoomOptionId(RoomOption roomOption);

	ServiceOption getServiceOptionId(ServiceOption serviceOption);

	WorkationOption getWorkationOptionId(WorkationOption workationOption);

}
