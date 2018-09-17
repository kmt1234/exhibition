package customerService.dao;

import java.util.Date;
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
import customerService.bean.PlayBookDTO;
import customerService.bean.SalesExhigitionDTO;
import rental.bean.ExhibitionDTO;

@Transactional
@Component
public class CustomerServiceDAOMybatis implements CustomerServiceDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int getTotalC_notice() { // 공지사항 총 글수
		return sqlSession.selectOne("customerServiceSQL.getTotalC_notice");
	}
	public List<CustomerServiceDTO> getNoticeList(Map<String, Integer> map) {//공지사항 리스트 불러오기
		return sqlSession.selectList("customerServiceSQL.getNoticeList", map);
	}
	public int getTotalC_notice_Search(Map<String, String> map) {
		return sqlSession.selectOne("customerServiceSQL.getTotalC_notice_Search", map);
	}
	public List<CustomerServiceDTO> C_notice_Search(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.C_notice_Search", map);
	}
	public CustomerServiceDTO getNoticeInfo(String seq) { // 공지사항 제목 클릭시 내용 보기
		return sqlSession.selectOne("customerServiceSQL.getNoticeInfo", seq);
	}
	public void C_notice_Write(Map<String, String> map) {// 공지사항 관리자가 작성하기
		sqlSession.insert("customerServiceSQL.C_notice_Write", map);		
	}
	public void C_notice_Modify(Map<String, String> map) {// 공지사항 관리자가 수정하기
		sqlSession.update("customerServiceSQL.C_notice_Modify", map);
	}
	public void C_notice_Delete(String seq) {// 공지사항 관리자가 삭제하기
		sqlSession.delete("customerServiceSQL.C_notice_Delete", seq);
	}
	
	
	
	
	public int getTotalC_inquire() {	//고객이 소리 문의받은 글수
		return sqlSession.selectOne("customerServiceSQL.getTotalC_inquire");
	}
	public List<CustomerServiceDTO> getInquireList(Map<String, Integer> map) {// 고객의 소리 문의받은 리스트 불러오기
		return sqlSession.selectList("customerServiceSQL.getInquireList", map);
	}
	public int getTotalC_inquire_Search(Map<String, String> map) {	//고객의 소리 검색된 글 수
		return sqlSession.selectOne("customerServiceSQL.getTotalC_inquire_Search", map);
	}
	public List<CustomerServiceDTO> C_inquire_Search(Map<String, String> map) {	//고객의 소리 검색
		return sqlSession.selectList("customerServiceSQL.C_inquire_Search", map);
	}
	public void C_checkInquire(CustomerServiceDTO customerServiceDTO) {// 고객의 소리 고객이 작성후 등록하기
		sqlSession.insert("customerServiceSQL.C_checkInquire", customerServiceDTO);
	}
	public CustomerServiceDTO getInquireInfo(String seq) {// 고객의 소리 제목클릭 후 내용 보기
		return sqlSession.selectOne("customerServiceSQL.getInquireInfo", seq);
	}
	public CustomerServiceDTO getReplyInfo(String seq) {// 고객의 소리 관리자가 문의 답변 등록하기
		return sqlSession.selectOne("customerServiceSQL.getReplyInfo", seq);
	}
	
	
	
	
	public List<CustomerServiceDTO> getQnA_Classify(String classify) {// 자주묻는 질문 리스트 불러오기 & 버튼마다 리스트 불러오기
		return sqlSession.selectList("customerServiceSQL.getQnA_Classify", classify);
	}
	public void C_QnA_checkWrite(Map<String, String> map) {// 자주묻는 질문 관리자가 작성하기
		sqlSession.insert("customerServiceSQL.C_QnA_checkWrite", map);		
	}
	
	
	
	
	public void C_contactList_checkWrite(Map<String, String> map) {// 주요시설 연락처 관리자가 작성하기
		sqlSession.insert("customerServiceSQL.C_contactList_checkWrite", map);		
	}
	public int getTotalC_contactList() {// 주요시설 연락처 총 글수
		return sqlSession.selectOne("customerServiceSQL.getTotalC_contactList");
	}
	public List<CustomerServiceDTO> getContactList(Map<String, Integer> map) {// 주요시설 연락처 리스트 불러오기
		return sqlSession.selectList("customerServiceSQL.getContactList", map);
	}
	
	public int getTotalC_contactList_Search(Map<String, String> map) {
		return sqlSession.selectOne("customerServiceSQL.getTotalC_contactList_Search", map);
	}
	public List<CustomerServiceDTO> C_contactList_Search(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.C_contactList_Search", map);
	}
		public void C_contactList_Delete(List<Integer> list) {
		sqlSession.delete("customerServiceSQL.C_contactList_Delete", list);
	}
	
	
	
	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~```*/
	
	
	
	
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
	public void C_hotelboardMod(HotelboardDTO hotelboardDTO) {
		sqlSession.update("customerServiceSQL.C_hotelboardMod", hotelboardDTO);	
	}

	//매출가져오기
	public List<SalesExhigitionDTO> getSalesExhibition(String salesMon) {
		return sqlSession.selectList("customerServiceSQL.getSalesExhibition", salesMon);
	}
	//매출가져오기
	public int getSalesTotalRentExhibition(String salesMon) {
		if(sqlSession.selectOne("customerServiceSQL.getSalesTotalRentExhibition", salesMon)==null) {
			return 0;
		} else {
			return sqlSession.selectOne("customerServiceSQL.getSalesTotalRentExhibition", salesMon);
		}
	}
}