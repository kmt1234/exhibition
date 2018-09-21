package rental.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import rental.bean.BusinessRoomDTO;

@Transactional
@Component
public class BusinessRoomDAOMybatis implements BusinessRoomDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<BusinessRoomDTO> getCalendar(String businessRoom) {
		return sqlSession.selectList("businessRoomSQL.getCalendar", businessRoom);
	}

	public List<BusinessRoomDTO> getTimeListBusinessRoom(Map<String, String> map) {
		return sqlSession.selectList("businessRoomSQL.getTimeListBusinessRoom", map);
	}

	public void rentalBusinessRoom(BusinessRoomDTO businessRoomDTO) {
		for(int i = 0; i < businessRoomDTO.getCheckRow().length; i++) {
			businessRoomDTO.setTime(businessRoomDTO.getCheckRow()[i]);;
			sqlSession.insert("businessRoomSQL.rentalBusinessRoom", businessRoomDTO);
		}
		
	}
	
	
}
