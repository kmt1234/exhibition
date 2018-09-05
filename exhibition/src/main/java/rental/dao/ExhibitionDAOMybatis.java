package rental.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

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
	
}
