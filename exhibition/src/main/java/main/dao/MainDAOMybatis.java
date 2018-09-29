package main.dao;

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
import main.bean.MainDTO;
import member.bean.MemberDTO;
import performance.bean.Book_exhibition_membersDTO;
import performance.bean.Book_performance_membersDTO;
import rental.bean.ExhibitionDTO;

@Transactional
@Component
public class MainDAOMybatis implements MainDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<MainDTO> index_notice_Search(Map<String, String> map) {
		return sqlSession.selectList("mainSQL.index_notice_Search", map);
	}

	public int getTotal_index_notice_Search(Map<String, String> map) {
		return sqlSession.selectOne("mainSQL.getTotal_index_notice_Search", map);
	}
	
	public List<MainDTO> index_QnA_Search(Map<String, String> map) {
		return sqlSession.selectList("mainSQL.index_QnA_Search", map);
	}

	public int getTotal_index_QnA_Search(Map<String, String> map) {
		return sqlSession.selectOne("mainSQL.getTotal_index_QnA_Search", map);
	}

	public List<MainDTO> index_contactList_Search(Map<String, String> map) {
		return sqlSession.selectList("mainSQL.index_contactList_Search", map);
	}

	public int getTotal_index_contactList_Search(Map<String, String> map) {
		return sqlSession.selectOne("mainSQL.getTotal_index_contactList_Search", map);
	}

	public List<MainDTO> index_eventboard_Search(Map<String, String> map) {
		return sqlSession.selectList("mainSQL.index_eventboard_Search", map);
	}

	public int getTotal_index_eventboard_Search(Map<String, String> map) {
		return sqlSession.selectOne("mainSQL.getTotal_index_eventboard_Search", map);
	}
	
	public List<MainDTO> index_eventboard_play_Search(Map<String, String> map) {
		return sqlSession.selectList("mainSQL.index_eventboard_play_Search", map);
	}

	public int getTotal_index_eventboard_play_Search(Map<String, String> map) {
		return sqlSession.selectOne("mainSQL.getTotal_index_eventboard_play_Search", map);
	}
	
	public List<MainDTO> index_hotel_list_Search(Map<String, String> map) {
		return sqlSession.selectList("mainSQL.index_hotel_list_Search", map);
	}

	public int getTotal_index_hotel_list_Search(Map<String, String> map) {
		return sqlSession.selectOne("mainSQL.getTotal_index_hotel_list_Search", map);
	}
}