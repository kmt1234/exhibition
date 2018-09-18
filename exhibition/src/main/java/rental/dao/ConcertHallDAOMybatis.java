package rental.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import rental.bean.ConcertHallDTO;

@Transactional
@Component
public class ConcertHallDAOMybatis implements ConcertHallDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<ConcertHallDTO> getCalendar(String hallName) {
		return sqlSession.selectList("concertHallSQL.getCalendar", hallName);
	}
}
