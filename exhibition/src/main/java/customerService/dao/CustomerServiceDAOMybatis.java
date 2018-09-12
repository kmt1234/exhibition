package customerService.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import customerService.bean.CustomerServiceDTO;
import customerService.bean.EventboardDTO;
import customerService.bean.ImageboardDTO;

@Transactional
@Component
public class CustomerServiceDAOMybatis implements CustomerServiceDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int getTotalC_notice() { // 공지사항 총 글수
		return sqlSession.selectOne("customerServiceSQL.getTotalC_notice");
	}
	public CustomerServiceDTO getNoticeInfo(String seq) { // 공지사항 제목 클릭스 내용 보기
		return sqlSession.selectOne("customerServiceSQL.getNoticeInfo", seq);
	}
	public void C_notice_Write(Map<String, String> map) {// 공지사항 관리자가 작성하기
		sqlSession.insert("customerServiceSQL.C_notice_Write", map);		
	}
	public List<CustomerServiceDTO> getNoticeList(Map<String, Integer> map) {//공지사항 리스트 불러오기
		return sqlSession.selectList("customerServiceSQL.getNoticeList", map);
	}
	public List<CustomerServiceDTO> C_notice_Search(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.C_notice_Search", map);
	}
	
	public int getTotalC_notice_Search(Map<String, String> map) {
		return sqlSession.selectOne("customerServiceSQL.getTotalC_notice_Search", map);
	}
	
	public void C_notice_Modify(Map<String, String> map) {// 공지사항 관리자가 수정하기
		sqlSession.update("customerServiceSQL.C_notice_Modify", map);
	}
	public void C_notice_Delete(String seq) {// 공지사항 관리자가 삭제하기
		sqlSession.delete("customerServiceSQL.C_notice_Delete", seq);
	}
	public void C_checkInquire(CustomerServiceDTO customerServiceDTO) {// 고객의 소리 고객이 작성후 등록하기
		sqlSession.insert("customerServiceSQL.C_checkInquire", customerServiceDTO);
	}
	
	public List<CustomerServiceDTO> getQnA_Classify(String classify) {// 자주묻는 질문 리스트 불러오기 & 버튼마다 리스트 불러오기
		return sqlSession.selectList("customerServiceSQL.getQnA_Classify", classify);
	}
	public void C_QnA_checkWrite(Map<String, String> map) {// 자주묻는 질문 관리자가 작성하기
		sqlSession.insert("customerServiceSQL.C_QnA_checkWrite", map);		
	}

	public List<CustomerServiceDTO> getInquireList() {// 고객의 소리 문의받은 리스트 불러오기
		return sqlSession.selectList("customerServiceSQL.getInquireList");
	}

	public CustomerServiceDTO getInquireInfo(String seq) {// 고객의 소리 묻의 받은 리스트 불러오기
		return sqlSession.selectOne("customerServiceSQL.getInquireInfo", seq);
	}
	
	public CustomerServiceDTO getReplyInfo(String seq) {// 고객의 소리 관리자가 문의 답변 등록하기
		return sqlSession.selectOne("customerServiceSQL.getReplyInfo", seq);
	}
	public void C_contactList_checkWrite(Map<String, String> map) {// 주요시설 연락처 관리자가 작성하기
		sqlSession.insert("customerServiceSQL.C_contactList_checkWrite", map);		
	}

	public List<CustomerServiceDTO> getContactList(Map<String, Integer> map) {// 주요시설 연락처 리스트 불러오기
		return sqlSession.selectList("customerServiceSQL.getContactList", map);
	}
	public int getTotalC_contactList() {// 주요시설 연락처 총 글수
		return sqlSession.selectOne("customerServiceSQL.getTotalC_contactList");
	}
	
	public List<CustomerServiceDTO> C_contactList_Search(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.C_contactList_Search", map);
	}
	
	public int getTotalC_contactList_Search(Map<String, String> map) {
		return sqlSession.selectOne("customerServiceSQL.getTotalC_contactList_Search", map);
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
	
	

}