package customerService.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import customerService.bean.CustomerServiceDTO;
import customerService.bean.EventboardDTO;
import customerService.bean.HotelboardDTO;
import customerService.bean.ImageboardDTO;
import customerService.bean.PlayBookDTO;

public interface CustomerServiceDAO {
	public List<CustomerServiceDTO> getNoticeList(Map<String, Integer> map);
	 
	public CustomerServiceDTO getNoticeInfo(String seq);
	   
	public void C_notice_Write(Map<String, String> map);
	
	public int getTotalC_notice();
	   
	public void C_notice_Modify(Map<String, String> map);
	
	public void C_notice_Delete(String seq);
	
	public List<CustomerServiceDTO> getInquireList();
	
	public void C_checkInquire(CustomerServiceDTO customerServiceDTO);
	   
	public CustomerServiceDTO getReplyInfo(String seq);
	   
	public void C_QnA_checkWrite(Map<String, String> map);
	   
	public CustomerServiceDTO getInquireInfo(String seq);
	
	public List<CustomerServiceDTO> getQnA_Classify(String classify);
	   
	public List<CustomerServiceDTO> getQnAList();
	   
	public void C_contactList_checkWrite(Map<String, String> map);
	
	public List<CustomerServiceDTO> getContactList();
		
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

		public HotelboardDTO getHotelInfo(String seq);//호텔리스트 수정 클릭시 상세보기
		
		public void eventInfoWrite_play_bookDB(PlayBookDTO playBookDTO);
}