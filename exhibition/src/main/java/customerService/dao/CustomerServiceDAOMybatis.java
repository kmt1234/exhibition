package customerService.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import customerService.bean.CustomerServiceDTO;
import customerService.bean.EventboardDTO;
import customerService.bean.HotelboardDTO;
import customerService.bean.ImageboardDTO;

@Transactional
@Component
public class CustomerServiceDAOMybatis implements CustomerServiceDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public void C_notice_Write(Map<String, String> map) {
		sqlSession.insert("customerServiceSQL.C_notice_Write", map);		
	}
	public void C_notice_Modify(Map<String, String> map) {
		sqlSession.update("customerServiceSQL.C_notice_Modify", map);
	}


	public void C_inquire(CustomerServiceDTO customerServiceDTO) {
		sqlSession.insert("customerServiceSQL.C_inquire", customerServiceDTO);
	}
	
	public void C_QnA_Write(Map<String, String> map) {
		sqlSession.insert("customerServiceSQL.C_QnA_Write", map);		
	}

	public void C_contactList_Write(Map<String, String> map) {
		sqlSession.insert("customerServiceSQL.C_contactList_Write", map);		
	}


	public List<CustomerServiceDTO> getNoticeList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.getNoticeList");
	}


	public CustomerServiceDTO getInfo(String seq) {
		return sqlSession.selectOne("customerServiceSQL.getInfo", seq);
	}


	public void C_notice_Delete(String seq) {
		sqlSession.delete("customerServiceSQL.C_notice_Delete", seq);
	}




	public List<CustomerServiceDTO> getInquireList() {
		return sqlSession.selectList("customerServiceSQL.getInquireList");
	}


	public CustomerServiceDTO getInquireInfo(String seq) {
		return sqlSession.selectOne("customerServiceSQL.getInquireInfo", seq);
	}


	public List<CustomerServiceDTO> getQnAList() {
		return sqlSession.selectList("customerServiceSQL.getQnAList");
	}


	public List<CustomerServiceDTO> getContactList() {
		return sqlSession.selectList("customerServiceSQL.getContactList");
	}

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
	public List<ImageboardDTO> getImageboardSlide() {
		return sqlSession.selectList("customerServiceSQL.getImageboardSlide");
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
	public List<HotelboardDTO> hotelList() {
		return sqlSession.selectList("customerServiceSQL.hotelList");
	}
	
	public CustomerServiceDTO getNoticeInfo(String seq) {
		// TODO Auto-generated method stub
		return null;
	}
	public int getTotalC_notice() {
		// TODO Auto-generated method stub
		return 0;
	}

}