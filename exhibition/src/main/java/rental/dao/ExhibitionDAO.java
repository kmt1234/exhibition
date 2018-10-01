package rental.dao;

import java.util.List;
import java.util.Map;

import customerService.bean.EventboardDTO;
import customerService.bean.SalesExhibitionDTO;
import performance.bean.PerformanceDTO;
import rental.bean.ConcertHallDTO;
import rental.bean.ExhibitionDTO;

public interface ExhibitionDAO {

	public String searchRentDay(Map<String, String> map);

	public List<ExhibitionDTO> getCalendar(String booth);

	public List<ExhibitionDTO> getAllCalendar();
	
	public void reservationHoll(ExhibitionDTO exhibitionDTO);

	public int getRateExhibition(String booth);

	public void updateExhibitionRate(Map<String, String> map);



}
