package rental.dao;

import java.util.List;
import java.util.Map;

import rental.bean.ConcertHallDTO;

public interface ConcertHallDAO {

	List<ConcertHallDTO> getCalendar(String hallName);

	String searchConcertHallRentDay(Map<String, String> map);

	void reservationConcertHall(ConcertHallDTO concertHallDTO);

}
