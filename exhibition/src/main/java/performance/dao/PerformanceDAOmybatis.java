package performance.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import customerService.bean.EventboardDTO;
import performance.bean.Book_performance_membersDTO;
import performance.bean.PerformanceDTO;

@Component
@Transactional
public class PerformanceDAOmybatis implements PerformanceDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<EventboardDTO> getPerformance() {
		return sqlSession.selectList("performanceSQL.getPerformance");
	}
	
	//공연일정 리스트 가져오는 메소드
	public List<EventboardDTO> getPlayList(Map<String,Integer> map) {
		return sqlSession.selectList("performanceSQL.getPlayList", map);
	}
	
	//공연일정 리스트 총 글수 가져오는 메소드
	public int getPlayListTotalA() {
		return sqlSession.selectOne("performanceSQL.getPlayListTotalA");
	}
	
	//전시회 일정 리스트 총 글수 가져오는 메소드 
	public int getExhibitionListTotalA() {
		return sqlSession.selectOne("performanceSQL.getExhibitionListTotalA");
	}
	
	//전시회 일정 리스트 가져오는 메소드 
	public List<EventboardDTO> getExhibitionList(Map<String, Integer> map) {
		return sqlSession.selectList("performanceSQL.getExhibitionList", map);
	}

	public List<EventboardDTO> getPerformancePlay() {
		return sqlSession.selectList("performanceSQL.getPerformancePlay");
	}
	
	//공연 예약하기 폼
	public EventboardDTO performanceBook(String seq) {
		return sqlSession.selectOne("performanceSQL.performanceBook", seq);
	}

	//예매자 등록(예매자 DB)
	public int bookPlayMembers(Book_performance_membersDTO book_performance_membersDTO) {
		return sqlSession.insert("performanceSQL.bookPlayMembers", book_performance_membersDTO);
		
	}
	
	//예매 수만큼 잔여티켓 감소
	public void bookPlayMembers_calculate(Book_performance_membersDTO book_performance_membersDTO) {
		sqlSession.update("performanceSQL.bookPlayMembers_calculate", book_performance_membersDTO);
		
	}
	
	//연극 잔여좌석 가져오는 메소드
	public String checkRemainSeats(Map<String, String> map) {
		return sqlSession.selectOne("performanceSQL.checkRemainSeats", map);
	}

	//선택일자의  해당 연극 예매된 티켓 수 가져오기
	public String checkUsedSeats(Map<String, String> map) {
		return sqlSession.selectOne("performanceSQL.checkUsedSeats", map);
	}
	

}
