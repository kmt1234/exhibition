package main.dao;

import java.util.ArrayList;
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
import customerService.bean.SalesBusinessRoomDTO;
import customerService.bean.SalesConcertHallDTO;
import customerService.bean.SalesExhibitionDTO;
import main.bean.MainDTO;
import main.bean.MainSlideDTO;
import member.bean.MemberDTO;
import performance.bean.Book_exhibition_membersDTO;
import performance.bean.Book_performance_membersDTO;
import rental.bean.ExhibitionDTO;

public interface MainDAO {

	public List<MainDTO> index_notice_Search(Map<String, String> map);
	
	public int getTotal_index_notice_Search(Map<String, String> map);

	public List<MainDTO> index_QnA_Search(Map<String, String> map);
	
	public int getTotal_index_QnA_Search(Map<String, String> map);

	public List<MainDTO> index_contactList_Search(Map<String, String> map);

	public int getTotal_index_contactList_Search(Map<String, String> map);

	public List<MainDTO> index_eventboard_Search(Map<String, String> map);

	public int getTotal_index_eventboard_Search(Map<String, String> map);
	
	public List<MainDTO> index_eventboard_play_Search(Map<String, String> map);

	public int getTotal_index_eventboard_play_Search(Map<String, String> map);

	public List<MainDTO> index_hotel_list_Search(Map<String, String> map);

	public int getTotal_index_hotel_list_Search(Map<String, String> map);

	public List<EventboardDTO> index_exSlider();

	public void inputMainSlideDB(String string);	//mainSlideDB에 저장

	public List<MainSlideDTO> getMainSlideDB();	//mainSlideDB에 불러오기

	public void deleteMainSlideDB();	//mainSlideDB 삭제

}