package performance.dao;

import java.util.List;
import java.util.Map;

import customerService.bean.EventboardDTO;
import customerService.bean.ExhibitionBookDTO;
import performance.bean.Book_exhibition_membersDTO;
import performance.bean.Book_performance_membersDTO;


public interface PerformanceDAO {

	public List<EventboardDTO> getPerformance();

	public List<EventboardDTO> getPlayList(Map<String,String> map);	//공연일정 리스트 가져오는 메소드

	public int getPlayListTotalA();	//공연일정 리스트 총 글수 가져오는 메소드

	public int getExhibitionListTotalA();	// 전시회 일정 리스트 총 글수 가져오는 메소드

	public List<EventboardDTO> getExhibitionList(Map<String, String> map);	// 전시회 일정 리스트 가져오는 메소드

	public List<EventboardDTO> getPerformancePlay();
	
	
	public EventboardDTO performanceBook(String seq);	//공연 예약하기 폼

	public int bookPlayMembers(Book_performance_membersDTO book_performance_membersDTO);	//공연 예매자 등록 메소드(예매자 DB 넣기)
	public void bookPlayMembers_calculate(Book_performance_membersDTO book_performance_membersDTO);	//예매 수만큼 잔여티켓 감소

	public String checkRemainSeats(Map<String, String> map);	//선택일자의 해당 연극 잔여좌석 가져오기(기본값:일별 티켓 발행 수)
	public String checkUsedSeats(Map<String, String> map);		//선택일자의  해당 연극 예매된 티켓 수 가져오기

	public EventboardDTO exhibitionBook(String seq);	//전시회 예약하기 폼

	public int bookExhibitionMembers(Book_exhibition_membersDTO book_exhibition_membersDTO);	//전시회 예매자 등록 메소드(예매자 DB 넣기)
	public void bookExhibitionMembers_calculate(Book_exhibition_membersDTO book_exhibition_membersDTO);	//예매 수만큼 잔여티켓 감소

	public String checkRemainSeats_ex(Map<String, String> map);	//선택일자의 해당 전시회 잔여좌석 가져오기(기본값:일별 티켓 발행 수)
	public String checkUsedSeats_ex(Map<String, String> map);	//선택일자의  해당 전시회 예매된 티켓 수 가져오기

	public List<EventboardDTO> getNextPlayList(Map<String, String> map);	//연극 3개월 후 일정 가져오는 메소드
	public int getNextPlayListTotalA(Map<String, String> map);	//연극 3개월 후 일정 수 가져오는 메소드

	public List<EventboardDTO> getPrevPlayList(Map<String, String> map);	//연극 3개월 전 일정 가져오는 메소드
	public int getPrevPlayListTotalA(Map<String, String> map);	//연극 3개월 전 일정 수 가져오는 메소드

	public List<EventboardDTO> getNextExhibitionList(Map<String, String> map);	//전시회 3개월 후 일정 가져오는 메소드
	public int getNextExhibitionListTotalA(Map<String, String> map);	//전시회 3개월 후 일정 수 가져오는 메소드	

	public List<EventboardDTO> getPrevExhibitionList(Map<String, String> map);	////전시회 3개월 전 일정 가져오는 메소드	
	public int getPrevExhibitionListTotalA(Map<String, String> map);	//전시회 3개월 전 일정 수 가져오는 메소드	

	public List<EventboardDTO> getAllListExhibition(String date); //해당하는 날의 전시 리스트 가져오기

	public List<EventboardDTO> getAllListConcert(String date);//해당하는 날의 공연 리스트 가져오기

	public List<EventboardDTO> getAllExhibitionList(Map<String, Integer> map);//박람회-리스트 전체 일정 가져오기

	public int getAllListTotalA(Map<String, Integer> map); //전체 리스트 총글구하기

	public int getAllListTotalA_Prev(Map<String, Integer> map);//전체리스트 3개월이전 총글구하기

	public List<EventboardDTO> getAllExhibitionList_Prev(Map<String, Integer> map);//전체리스트 3개월 이전 글 뿌리기

	public int getAllListTotalA_After(Map<String, Integer> map); //전체리스트 3개월 이후 총글구하기

	public List<EventboardDTO> getAllExhibitionList_After(Map<String, Integer> map);//전체리스트 3개월 이후 글 뿌리기
	

	

		

}
