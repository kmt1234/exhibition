package rental.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import rental.bean.ConcertHallDTO;
import rental.bean.ExhibitionDTO;

@Transactional
@Component
public class ConcertHallDAOMybatis implements ConcertHallDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<ConcertHallDTO> getCalendar(String hallName) {
		return sqlSession.selectList("concertHallSQL.getCalendar", hallName);
	}

	public String searchConcertHallRentDay(Map<String, String> map) {
		ConcertHallDTO concertHallDTO = sqlSession.selectOne("concertHallSQL.searchConcertHallRentDay", map);
		if(concertHallDTO==null) {
			return "not_exist";
		} else {
			return "exist";
		}
	}

	public void reservationConcertHall(ConcertHallDTO concertHallDTO) {
		sqlSession.insert("concertHallSQL.reservationConcertHall", concertHallDTO);
		
	}

	public int getRateConcertHall(String hallName) {
		return sqlSession.selectOne("concertHallSQL.getRateConcertHall", hallName);
	}

	public void updateConcertHallRate(Map<String, String> map) {
		sqlSession.update("concertHallSQL.updateConcertHallRate", map);
		
	}
	
}
