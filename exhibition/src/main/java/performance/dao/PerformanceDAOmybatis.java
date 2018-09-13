package performance.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import customerService.bean.EventboardDTO;
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
	
}
