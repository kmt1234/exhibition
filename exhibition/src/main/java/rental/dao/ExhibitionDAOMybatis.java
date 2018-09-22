package rental.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import customerService.bean.EventboardDTO;
import performance.bean.PerformanceDTO;
import rental.bean.ConcertHallDTO;
import rental.bean.ExhibitionDTO;

@Transactional
@Component
public class ExhibitionDAOMybatis implements ExhibitionDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public String searchRentDay(Map<String, String> map) {
		ExhibitionDTO exhibitionDTO = sqlSession.selectOne("exhibitionSQL.searchRentDay", map);
		if(exhibitionDTO==null) {
			return "not_exist";
		} else {
			return "exist";
		}
	}

	public void reservationHoll(ExhibitionDTO exhibitionDTO) {
		sqlSession.insert("exhibitionSQL.reservationHoll", exhibitionDTO);
		
	}

	public List<ExhibitionDTO> getCalendar(String booth) {
		return sqlSession.selectList("exhibitionSQL.getCalendar", booth);
	}

	public List<ExhibitionDTO> getAllCalendar() {
		return sqlSession.selectList("exhibitionSQL.getAllCalendar");
	}

	public List<ExhibitionDTO> getSalesExhibition(String salesMon) {
		return sqlSession.selectList("exhibitionSQL.getSalesExhibition", salesMon);
	}

	public int getSalesTotalRentExhibition(String salesMon) {
		if(sqlSession.selectOne("exhibitionSQL.getSalesTotalRentExhibition", salesMon)==null) {
			return 0;
		} else {
			return sqlSession.selectOne("exhibitionSQL.getSalesTotalRentExhibition", salesMon);
		}
			
		
	}


	
	
}
