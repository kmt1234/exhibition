package main.dao;

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
import member.bean.MemberDTO;
import performance.bean.Book_exhibition_membersDTO;
import performance.bean.Book_performance_membersDTO;
import rental.bean.ExhibitionDTO;

public interface MainDAO {

	public List<MainDTO> index_NoticeSearch(Map<String, String> map);
	
	public int getTotal_index_NoticeSearch(Map<String, String> map);

}