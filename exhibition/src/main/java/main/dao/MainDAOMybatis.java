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

	public List<MainDTO> index_NoticeSearch(Map<String, String> map) {
		return sqlSession.selectList("mainSQL.index_NoticeSearch", map);
	}

	public int getTotal_index_NoticeSearch(Map<String, String> map) {
		return sqlSession.selectOne("mainSQL.getTotal_index_NoticeSearch", map);
	}
	
}