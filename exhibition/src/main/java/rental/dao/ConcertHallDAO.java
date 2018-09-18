package rental.dao;

import java.util.List;

import rental.bean.ConcertHallDTO;

public interface ConcertHallDAO {

	List<ConcertHallDTO> getCalendar(String hallName);

}
