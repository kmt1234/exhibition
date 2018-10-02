package rental.dao;

import java.util.List;
import java.util.Map;

import rental.bean.BusinessRoomDTO;

public interface BusinessRoomDAO {

	List<BusinessRoomDTO> getCalendar(String businessRoom);

	List<BusinessRoomDTO> getTimeListBusinessRoom(Map<String, String> map);

	void rentalBusinessRoom(BusinessRoomDTO businessRoomDTO);

	int getRateBusinessRoom(String businessRoom);

	void updateBusinessRoomRate(Map<String, String> map);

}
