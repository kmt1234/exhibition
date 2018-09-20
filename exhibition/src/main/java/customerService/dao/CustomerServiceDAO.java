package customerService.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import company.bean.CompanyDTO;
import customerService.bean.CustomerServiceDTO;
import customerService.bean.EventboardDTO;
import customerService.bean.ExhibitionBookDTO;
import customerService.bean.HotelboardDTO;
import customerService.bean.ImageboardDTO;
import customerService.bean.PlayBookDTO;
import customerService.bean.SalesExhigitionDTO;
import member.bean.MemberDTO;
import rental.bean.ExhibitionDTO;

public interface CustomerServiceDAO {
	// 공지사항 총 글수
	public int getTotalC_notice();													
	//공지사항 리스트 불러오기
	public List<CustomerServiceDTO> getNoticeList(Map<String, Integer> map);		
	// 공지사항 검색된 글 수
	public int getTotalC_notice_Search(Map<String, String> map);					
	// 공지사항 검색된 글 불러오기
	public List<CustomerServiceDTO> C_notice_Search(Map<String, String> map);		
	// 공지사항 제목 클릭시 내용 보기
	public CustomerServiceDTO getNoticeInfo(String seq);							
	// 공지사항 관리자가 작성하기
	public void C_notice_Write(Map<String, String> map);							
	// 공지사항 관리자가 수정하기
	public void C_notice_Modify(Map<String, String> map);							
	// 공지사항 관리자가 삭제하기
	public void C_notice_Delete(String seq);										

	
	
	// 고객의 소리 문의 받은 글 수
	public int getTotalC_inquire();													
	// 고객의 소리 문의 받은 리스트 불러오기
	public List<CustomerServiceDTO> getInquireList(Map<String, Integer> map);		
	// 고객의 소리 문의 받은 글 중 검색된 글 불러오기
	public int getTotalC_inquire_Search(Map<String, String> map);					
	// 고객의 소리 문의 받은 글 불러오기
	public List<CustomerServiceDTO> C_inquire_Search(Map<String, String> map);		
	// 고객의 소리 고객이 작성후 등록하기
	public void C_checkInquire(CustomerServiceDTO customerServiceDTO);				
	// 고객의 소리 제목 클릭시 내용 보기
	public CustomerServiceDTO getInquireInfo(int seq);								
	// 고객의 소리 문의 답변하기
	public void C_inquire_Reply(CustomerServiceDTO customerServiceDTO);				
	
	
	
	// 자주묻는 질문 리스트 불러오기 & 버튼마다 리스트 불러오기
	public List<CustomerServiceDTO> getQnA_Classify(String classify);				
	// 자주묻는 질문 관리자가 작성하기
	public void C_QnA_checkWrite(Map<String, String> map);							
	
	
	
	// 주요시설 연락처 관리자가 작성하기
	public void C_contactList_checkWrite(Map<String, String> map);					
	// 주요시설 연락처 총 글수
	public int getTotalC_contactList();												
	// 주요시설 연락처 리스트 불러오기
	public List<CustomerServiceDTO> getContactList(Map<String, Integer> map);		
	// 주요시설 연락처 검색된 총 글수
	public int getTotalC_contactList_Search(Map<String, String> map);				
	// 주요시설 연락처 검색된 글 불러오기
	public List<CustomerServiceDTO> C_contactList_Search(Map<String, String> map);	
	// 주요시설 연락처 삭제하기
	public void C_contactList_Delete(List<Integer> list);
	
	/*	===============================================================*/
	
	public void imageboardWrite(ImageboardDTO imageboardDTO);
	
	public int getImageboardTotalA();
	
	public List<ImageboardDTO> imageboardList(Map<String, Integer> map);
	
	public void imageboardDelete(List<Integer> list);
	
	public List<ImageboardDTO> getList(List<Integer> list);
	
	public void eventInfoWrite(EventboardDTO eventboardDTO);	//박람회 정보 등록
	
	public List<ImageboardDTO> getImageboardSlide(List<String> list);	//메인(슬라이드 이미지 불러오기)
	
	public List<EventboardDTO> eventboardList(Map<String, Integer> map);	//박람회 업로드 리스트 가져오기
	
	public int getEventboardTotalA();	//박람회 업로드 리스트 총 글수 가져오기
	
	
	public void eventboardDelete(List<Integer> list);	//박람회 업로드 리스트 삭제 
	
	public List<EventboardDTO> eventboardList_play(Map<String, Integer> map);	//박람회 업로드 리스트 가져오기
	
	public int getEventboardTotalA_play();	//연극 업로드 리스트 총 글수 가져오기
	
	public void eventInfoWrite_play(EventboardDTO eventboardDTO); //연극 정보 등록
	
	public void eventboardDelete_play(List<Integer> list);	//연극 업로드 리스트 삭제
	
	public void hotelInfoWrite(HotelboardDTO hotelboardDTO); //호텔정보등록
	
	public List<HotelboardDTO> hotelList(Map<String, Integer> map); //호텔 숙박에 올려보기
	
	public void hotelDelete(List<Integer> list);//호텔리스트 삭제
	
	public List<HotelboardDTO> hotelImageDel(List<Integer> list);//호텔이미지 삭제 하기 위해 리스트 가져오기
	
	public int getHotelboardTotalA();//호텔리스트 총글수
	
	public EventboardDTO getEventboard(String seq);	//박람회 내용 보기(수정하기 위해)
	
	public EventboardDTO getPlayboard(String seq);//연극 내용 보기

	public HotelboardDTO getHotelInfo(String seq);//호텔리스트 수정 클릭시 상세보기
	
	public void eventInfoWrite_play_bookDB(PlayBookDTO playBookDTO);
	
	public void C_hotelboardMod(HotelboardDTO hotelboardDTO);//호텔 수정
	
	
	//매출현황
	public List<SalesExhigitionDTO> getSalesExhibition(String salesMon);

	public int getSalesTotalRentExhibition(String salesMon);

		//회원정보
	public List<MemberDTO> getMemberList(Map<String, Integer> map);
	//회원 페이징
	public int getMemberListTotal();
	//회원정보 검색
	public List<MemberDTO> memberListSearch(Map<String, String> map);
	//회원정보 검색 토탈 페이징
	public int getMemberListSearchTotal(Map<String, String> map);
	
	//사업자 정보
	public List<CompanyDTO> getCompanyList(Map<String, Integer> map);
	//사업자 페이징
	public int getCompanyTotal();
	//사업자 검색 
	public List<CompanyDTO> CompanyListSearch(Map<String, String> map);
	//사업자 검색 페이징
	public int getCompanyListSearchTotal(Map<String, String> map);

	public List<CompanyDTO> getCompanyView(String C_license);

	public ImageboardDTO getImageboard(String seq);//메인이미지 내용 보기(수정하기 위해)
	
	public void C_imageboardMod(ImageboardDTO imageboardDTO);//메인이미지 수정실행

	public void C_eventboardMod(EventboardDTO eventboardDTO);//박람회 수정 실행

	public void C_playboardMod(EventboardDTO eventboardDTO);//연극 수정실행

	public void eventboardDelete_play_book(List<Integer> list2);//예매날짜 지우기
	
	public void eventInfoWrite_exhibition_bookDB(ExhibitionBookDTO exhibitionBookDTO);	//박람회 일자별 DB 등록 메소드 
	
	public void C_playboardBookMod(EventboardDTO eventboardDTO);//연극 예매일짜별 제목 수정
	
	public EventboardDTO eventInfoWrite_play2(EventboardDTO eventboardDTO);//연극 예매일짜 삽입하기위한 시퀀스 가져오기

	
}