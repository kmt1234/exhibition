package performance.dao;

import java.util.List;
import java.util.Map;

import customerService.bean.EventboardDTO;
import performance.bean.Book_performance_membersDTO;
import performance.bean.PerformanceDTO;

public interface PerformanceDAO {

	public List<EventboardDTO> getPerformance();

	public List<EventboardDTO> getPlayList(Map<String,Integer> map);	//공연일정 리스트 가져오는 메소드

	public int getPlayListTotalA();	//공연일정 리스트 총 글수 가져오는 메소드

	public int getExhibitionListTotalA();	// 전시회 일정 리스트 총 글수 가져오는 메소드

	public List<EventboardDTO> getExhibitionList(Map<String, Integer> map);	// 전시회 일정 리스트 가져오는 메소드

	public List<EventboardDTO> getPerformancePlay();
	
	
	public EventboardDTO performanceBook(String seq);	//공연 예약하기 폼

	public int bookPlayMembers(Book_performance_membersDTO book_performance_membersDTO);	//예매자 등록 메소드(예매자 DB 넣기)

	public String checkRemainSeats(Map<String, String> map);	//선택일자의 해당 연극 잔여좌석 가져오기(기본값:일별 티켓 발행 수)

	public String checkUsedSeats(Map<String, String> map);		//선택일자의  해당 연극 예매된 티켓 수 가져오기

}
