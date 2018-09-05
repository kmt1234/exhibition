package rental.dao;

import java.util.List;
import java.util.Map;

import rental.bean.ExhibitionDTO;

public interface ExhibitionDAO {

	public String searchRentDay(Map<String, String> map);

	public void reservationHoll(ExhibitionDTO exhibitionDTO);

	public List<ExhibitionDTO> getCalendar(String booth);

}
