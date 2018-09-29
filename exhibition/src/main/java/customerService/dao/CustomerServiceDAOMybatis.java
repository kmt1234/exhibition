package customerService.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import company.bean.CompanyDTO;
import customerService.bean.CustomerServiceDTO;
import customerService.bean.EventboardDTO;
import customerService.bean.ExhibitionBookDTO;
import customerService.bean.HotelboardDTO;
import customerService.bean.ImageboardDTO;
import customerService.bean.PlayBookDTO;
import customerService.bean.SalesBusinessRoomDTO;
import customerService.bean.SalesConcertHallDTO;
import customerService.bean.SalesExhibitionDTO;
import member.bean.MemberDTO;
import performance.bean.Book_exhibition_membersDTO;
import performance.bean.Book_performance_membersDTO;
import rental.bean.BusinessRoomDTO;
import rental.bean.ConcertHallDTO;
import rental.bean.ExhibitionDTO;

@Transactional
@Component
public class CustomerServiceDAOMybatis implements CustomerServiceDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 공지사항 총 글수
	public int getTotalC_notice() { 
		return sqlSession.selectOne("customerServiceSQL.getTotalC_notice");
	}
	//공지사항 리스트 불러오기
	public List<CustomerServiceDTO> getNoticeList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.getNoticeList", map);
	}
	//공지사항 메인화면 리스트 불러오기
	public List<CustomerServiceDTO> getNoticeMainList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.getNoticeMainList", map);
	}
	//공지사항 검색된 글수
	public int getTotalC_notice_Search(Map<String, String> map) {
		return sqlSession.selectOne("customerServiceSQL.getTotalC_notice_Search", map);
	}
	//공지사항 검색된 글 불러오기
	public List<CustomerServiceDTO> C_notice_Search(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.C_notice_Search", map);
	}
	// 공지사항 제목 클릭시 내용 보기
	public CustomerServiceDTO getNoticeInfo(String seq) { 
		return sqlSession.selectOne("customerServiceSQL.getNoticeInfo", seq);
	}
	// 공지사항 관리자가 작성하기
	public void C_notice_Write(Map<String, String> map) {
		sqlSession.insert("customerServiceSQL.C_notice_Write", map);		
	}
	// 공지사항 관리자가 수정하기
	public void C_notice_Modify(Map<String, String> map) {
		sqlSession.update("customerServiceSQL.C_notice_Modify", map);
	}
	// 공지사항 관리자가 삭제하기
	public void C_notice_Delete(String seq) {
		sqlSession.delete("customerServiceSQL.C_notice_Delete", seq);
	}
	
	
	
	//고객이 소리 문의받은 글수
	public int getTotalC_inquire() {	
		return sqlSession.selectOne("customerServiceSQL.getTotalC_inquire");
	}
	// 고객의 소리 문의받은 리스트 불러오기
	public List<CustomerServiceDTO> getInquireList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.getInquireList", map);
	}
	//고객의 소리 검색된 글 수
	public int getTotalC_inquire_Search(Map<String, String> map) {	
		return sqlSession.selectOne("customerServiceSQL.getTotalC_inquire_Search", map);
	}
	//고객의 소리 검색
	public List<CustomerServiceDTO> C_inquire_Search(Map<String, String> map) {	
		return sqlSession.selectList("customerServiceSQL.C_inquire_Search", map);
	}
	// 고객의 소리 고객이 작성후 등록하기
	public void C_checkInquire(CustomerServiceDTO customerServiceDTO) {
		sqlSession.insert("customerServiceSQL.C_checkInquire", customerServiceDTO);
	}
	// 고객의 소리 제목클릭 후 내용 보기
	public CustomerServiceDTO getInquireInfo(int seq) {
		return sqlSession.selectOne("customerServiceSQL.getInquireInfo", seq);
	}
	// 고객의 소리 관리자가 문의 답변 등록하기
	public void C_inquire_Reply(CustomerServiceDTO customerServiceDTO) {
		sqlSession.update("customerServiceSQL.C_inquire_Reply1", customerServiceDTO);//step update
		sqlSession.insert("customerServiceSQL.C_inquire_Reply2", customerServiceDTO);//insert
		sqlSession.update("customerServiceSQL.C_inquire_Reply3", customerServiceDTO);//reply update
	}
	
	
	
	// 자주묻는 질문 리스트 불러오기 & 버튼마다 리스트 불러오기
	public List<CustomerServiceDTO> getQnA_Classify(String classify) {
		return sqlSession.selectList("customerServiceSQL.getQnA_Classify", classify);
	}
	// 자주묻는 질문 관리자가 작성하기
	public void C_QnA_checkWrite(Map<String, String> map) {
		sqlSession.insert("customerServiceSQL.C_QnA_checkWrite", map);		
	}
	// 자주 묻는 질문 관리자가 삭제하기
	public void C_QnA_Delete(List<Integer> list) {
		sqlSession.delete("customerServiceSQL.C_QnA_Delete", list);
	}
	
	
	// 주요시설 연락처 관리자가 작성하기
	public void C_contactList_checkWrite(Map<String, String> map) {
		sqlSession.insert("customerServiceSQL.C_contactList_checkWrite", map);		
	}
	// 주요시설 연락처 총 글수
	public int getTotalC_contactList() {
		return sqlSession.selectOne("customerServiceSQL.getTotalC_contactList");
	}
	// 주요시설 연락처 리스트 불러오기
	public List<CustomerServiceDTO> getContactList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.getContactList", map);
	}
	//주요시설 연락처 검색된 글수
	public int getTotalC_contactList_Search(Map<String, String> map) {
		return sqlSession.selectOne("customerServiceSQL.getTotalC_contactList_Search", map);
	}
	//주요시설 연락처 검색된글 불러오기
	public List<CustomerServiceDTO> C_contactList_Search(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.C_contactList_Search", map);
	}
	//주요시설 연락처 삭제
	public void C_contactList_Delete(List<Integer> list) {
		sqlSession.delete("customerServiceSQL.C_contactList_Delete", list);
	}
	
	
	
	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	
	
	
	
	public void imageboardWrite(ImageboardDTO imageboardDTO) {
		sqlSession.insert("customerServiceSQL.imageboardWrite",imageboardDTO);
	}
	public int getImageboardTotalA() {
		int totalA = sqlSession.selectOne("customerServiceSQL.getImageboardTotalA");
		return totalA;
	}

	public List<ImageboardDTO> imageboardList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.imageboardList",map);
	}

	public void imageboardDelete(List<Integer> list) {
		sqlSession.delete("customerServiceSQL.imageboardDelete",list);
	}

	public List<ImageboardDTO> getList(List<Integer> list) {
		return sqlSession.selectList("customerServiceSQL.getList",list);
		
	}
		
	//박람회 정보 등록
	public void eventInfoWrite(EventboardDTO eventboardDTO) {
		sqlSession.insert("customerServiceSQL.eventInfoWrite", eventboardDTO);
	}
	
	//메인(슬라이드 이미지 불러오기)
	public List<ImageboardDTO> getImageboardSlide(List<String> list) {
		return sqlSession.selectList("customerServiceSQL.getImageboardSlide",list);
	}
	
	//박람회 업로드 리스트 가져오기
	public List<EventboardDTO> eventboardList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.eventboardList", map);
	}
	
	//박람회 업로드 리스트 총 글수 가져오기
	public int getEventboardTotalA() {
		int totalA = sqlSession.selectOne("customerServiceSQL.getEventboardTotalA"); 
		return totalA;
	}

	//박람회 업로드 리스트 삭제 
	public void eventboardDelete(List<Integer> list) {
		sqlSession.delete("customerServiceSQL.eventboardDelete", list);
		
	}

	//연극 업로드 리스트 가져오기
	public List<EventboardDTO> eventboardList_play(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.eventboardList_play", map);
	}
	
	//연극 업로드 리스트 총 글수 가져오기
	public int getEventboardTotalA_play() {
		int totalA = sqlSession.selectOne("customerServiceSQL.getEventboardTotalA_play"); 
		return totalA;
	}
	
	//연극 정보 등록
	public void eventInfoWrite_play(EventboardDTO eventboardDTO) {
		sqlSession.insert("customerServiceSQL.eventInfoWrite_play", eventboardDTO);
	}
	
	//연극 업로드 리스트 삭제
	public void eventboardDelete_play(List<Integer> list) {
		sqlSession.delete("customerServiceSQL.eventboardDelete_play", list);
	}	
	//호텔정보등록
	public void hotelInfoWrite(HotelboardDTO hotelboardDTO) {
		sqlSession.insert("customerServiceSQL.hotelInfoWrite", hotelboardDTO);
	}
	//호텔리스트
	public List<HotelboardDTO> hotelList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.hotelList",map);
	}
	//호텔리스트 삭제
	public void hotelDelete(List<Integer> list) {
		sqlSession.delete("customerServiceSQL.hotelDelete", list);
	}
	//호텔이미지 삭제하기 위해 리스트 불러오기
		public List<HotelboardDTO> hotelImageDel(List<Integer> list) {
			return sqlSession.selectList("customerServiceSQL.hotelImageDel",list);
	}
	//호텔리스트 총글수
	public int getHotelboardTotalA() {
		int totalA = sqlSession.selectOne("customerServiceSQL.getHotelboardTotalA"); 
		return totalA;
	}
	//박람회 정보 보기(수정하기 위해)
	public EventboardDTO getEventboard(String seq) {
		return sqlSession.selectOne("customerServiceSQL.getEventboard", seq);
	}
	//호텔리스트 정보 보기(수정하기 위해)
	public HotelboardDTO getHotelInfo(String seq) {
		return sqlSession.selectOne("customerServiceSQL.getHotelboard", seq);
	}
	
	//연극정보 예매DB에 저장
	public void eventInfoWrite_play_bookDB(PlayBookDTO playBookDTO) {
		sqlSession.insert("customerServiceSQL.eventInfoWrite_play_bookDB", playBookDTO);
	}
	
	//호텔 수정
	public void C_hotelboardMod(HotelboardDTO hotelboardDTO) {
		sqlSession.update("customerServiceSQL.C_hotelboardMod", hotelboardDTO);	
	}

	//박람회 부스 매출가져오기
	public List<SalesExhibitionDTO> getSalesExhibition(String salesMon) {
		return sqlSession.selectList("customerServiceSQL.getSalesExhibition", salesMon);
	}
	
	//박람회 부스 총매출액가져오기
	public int getSalesTotalRentExhibition(String salesMon) {
		if(sqlSession.selectOne("customerServiceSQL.getSalesTotalRentExhibition", salesMon)==null) {
			return 0;
		} else {
			return sqlSession.selectOne("customerServiceSQL.getSalesTotalRentExhibition", salesMon);
		}
	}
	
	//콘서트 홀 매출 가져오기
	public List<SalesConcertHallDTO> getSalesConcertHall(String salesMon) {
		return sqlSession.selectList("customerServiceSQL.getSalesConcertHall", salesMon);
	}
	
	//콘서트 홀 총 매출액 가져오기
	public int getSalesTotalRentConcertHall(String salesMon) {
		if(sqlSession.selectOne("customerServiceSQL.getSalesTotalRentConcertHall", salesMon)==null) {
			return 0;
		} else {
			return sqlSession.selectOne("customerServiceSQL.getSalesTotalRentConcertHall", salesMon);
		}
	}
	
	//비즈니스룸 매출가져오기
	public List<SalesBusinessRoomDTO> getSalesBusinessRoom(String salesMon) {
		return sqlSession.selectList("customerServiceSQL.getSalesBusinessRoom", salesMon);
	}
	
	//비즈니스룸 총 매출액 가져오기
	public int getSalesTotalRentBusinessRoom(String salesMon) {
		if(sqlSession.selectOne("customerServiceSQL.getSalesTotalRentBusinessRoom", salesMon)==null) {
			return 0;
		} else {
			return sqlSession.selectOne("customerServiceSQL.getSalesTotalRentBusinessRoom", salesMon);
		}
	}
	
	//콘서트 티켓 매출 가져오기
	public List<EventboardDTO> getSalesConcertTicket(String salesMon) {
		return sqlSession.selectList("customerServiceSQL.getSalesConcertTicket", salesMon);
	}
	//콘서트 티켓 총 매출액
	public int getSalesTotalRentConcertTicket(String salesMon) {
		if(sqlSession.selectOne("customerServiceSQL.getSalesTotalRentConcertTicket", salesMon)==null) {
			return 0;
		} else {
			return sqlSession.selectOne("customerServiceSQL.getSalesTotalRentConcertTicket", salesMon);
		}
	}
	
	
	//회원정보 불러오기
	public List<MemberDTO> getMemberList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.getMemberList",map);
	}
	//회원 페이징처리
	public int getMemberListTotal() {
		return sqlSession.selectOne("customerServiceSQL.getMemberListTotal");
	}
	//회원검색
	public List<MemberDTO> memberListSearch(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.memberListSearch",map);
	}
	//회원검색페이지
	public int getMemberListSearchTotal(Map<String, String> map) {
		return sqlSession.selectOne("customerServiceSQL.getMemberListSearchTotal",map);
	}
	//박람회뷰
	public List<Book_exhibition_membersDTO> getExhibitionView(String M_Id) {
		return sqlSession.selectList("customerServiceSQL.getExhibitionView",M_Id);
	}
	//연극뷰
	public List<Book_exhibition_membersDTO> getPerformanceView(String M_Id) {
		return sqlSession.selectList("customerServiceSQL.getPerformanceView",M_Id);
	}
	//비즈니스뷰
	public List<BusinessRoomDTO> getBusinessRoomView(String M_Id) {
		return sqlSession.selectList("customerServiceSQL.getBusinessRoomView",M_Id);
	}
	
	//사업자 정보 불러오기
	public List<CompanyDTO> getCompanyList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.getCompanyList",map);
	}
	//사업자 페이징
	public int getCompanyTotal() {
		return sqlSession.selectOne("customerServiceSQL.getCompanyTotal");
	}
	//사업자 검색
	public List<CompanyDTO> CompanyListSearch(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.CompanyListSearch",map);
	}
	//사업자 검색토탈 페이징
	public int getCompanyListSearchTotal(Map<String, String> map) {
		return sqlSession.selectOne("customerServiceSQL.getCompanyListSearchTotal",map);
	}
	
	//사업자 뷰
	public List<ExhibitionDTO> getCompanyExView(String C_license) {
		return sqlSession.selectList("customerServiceSQL.getCompanyExView",C_license);
	}
	public List<ConcertHallDTO> getCompanyConView(String C_license) {
		return sqlSession.selectList("customerServiceSQL.getCompanyConView",C_license);
	}
	
	//연극수정하기 위해 값 불러오기
	public EventboardDTO getPlayboard(String seq) {
		return sqlSession.selectOne("customerServiceSQL.getPlayboard", seq);
	}
	
	//메인이미지 수정하기 위해 값 불러오기
	public ImageboardDTO getImageboard(String seq) {
		return sqlSession.selectOne("customerServiceSQL.getImageboard", seq);
	}
	public void C_imageboardMod(ImageboardDTO imageboardDTO) {//메인이미지 수정실행
		sqlSession.update("customerServiceSQL.C_imageboardMod", imageboardDTO);	
	}
	public void C_eventboardMod(EventboardDTO eventboardDTO) {//박람회 수정실행
		sqlSession.update("customerServiceSQL.C_eventboardMod", eventboardDTO);			
	}
	public void C_playboardMod(EventboardDTO eventboardDTO) {//연극 수정실행
		sqlSession.update("customerServiceSQL.C_playboardMod", eventboardDTO);			
	}
	
	//연극 예매티켓일자 삭제
	public void eventboardDelete_play_book(List<Integer> list2) {
		sqlSession.delete("customerServiceSQL.eventboardDelete_play_book", list2);
	}
	//박람회 일자별 DB 등록 메소드 
	public void eventInfoWrite_exhibition_bookDB(ExhibitionBookDTO exhibitionBookDTO) {
		sqlSession.insert("customerServiceSQL.eventInfoWrite_exhibition_bookDB", exhibitionBookDTO);
		
	}
		
	//연극 수정할때 예매일자별 날려버리기
	public void C_playboardBookDel(EventboardDTO eventboardDTO) {
		sqlSession.delete("customerServiceSQL.C_playboardBookDel", eventboardDTO);	
	}
	//연극 시퀀스 가져오기위해서
	public EventboardDTO eventInfoWrite_play2(EventboardDTO eventboardDTO) {
		return sqlSession.selectOne("customerServiceSQL.eventInfoWrite_play2", eventboardDTO);
	}
	
	//박람회 시퀀스 가져오기위해서
	public EventboardDTO eventInfoWrite2(EventboardDTO eventboardDTO) {
		return sqlSession.selectOne("customerServiceSQL.eventInfoWrite2", eventboardDTO);
	}
	
	//박람회 예매 지우기
	public void eventboardDelete_book(List<Integer> list2) {
		sqlSession.delete("customerServiceSQL.eventboardDelete_book", list2);	
	}
	
	//박람회 수정할때 예매일자별 날려버리기
	public void C_exhibitionboardBookDel(EventboardDTO eventboardDTO) {
		sqlSession.delete("customerServiceSQL.C_exhibitionboardBookDel", eventboardDTO);	
	}
	public List<Book_exhibition_membersDTO> getMemberView(String M_Id) {
		return sqlSession.selectList("customerServiceSQL.getMemberView",M_Id);
	}
	
	//회원 예약 취소
	public void memberExTicketDelete(int seq) {
		sqlSession.delete("customerServiceSQL.memberExTicketDelete",seq);
	}
	public void memberPerTicketDelete(int seq) {
		sqlSession.delete("customerServiceSQL.memberPerTicketDelete",seq);
	}
	public void memberBusinessTicketDelete(int seq) {
		System.out.println(seq);
		sqlSession.delete("customerServiceSQL.memberBusinessTicketDelete",seq);
		
	}
	
	//사업자 예약 삭제
	public void companyExDelete(int seq) {
		sqlSession.delete("customerServiceSQL.companyExDelete",seq);
	}
	public void companyConDelete(int seq) {
		sqlSession.delete("customerServiceSQL.companyConDelete",seq);
		
	}
	
	//전시회 층 예약 중복 체크
	public List<EventboardDTO> checkReservation_exhibition(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.checkReservation_exhibition", map);
	}
	
	//연극 공연장 예약 중복 체크
	public List<EventboardDTO> checkReservation_performance(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.checkReservation_performance", map);
	}
	public List<SalesExhibitionDTO> getYearMonthSalesExhibition(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<SalesConcertHallDTO> getYearMonthSalesConcertHall(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<SalesBusinessRoomDTO> getYearMonthBusinessRoom(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<EventboardDTO> getYearMonthConcertTicket(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<EventboardDTO> getSalesExhibitionTicket(String salesMon) {
		// TODO Auto-generated method stub
		return null;
	}
	public int getSalesTotalRentExhibitionTicket(String salesMon) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<EventboardDTO> getYearMonthExhibitionTicket(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
}