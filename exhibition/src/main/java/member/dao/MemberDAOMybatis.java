package member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import customerService.bean.EventboardDTO;
import customerService.bean.SalesBusinessRoomDTO;
import member.bean.MemberDTO;
import performance.bean.Book_performance_membersDTO;

@Transactional
@Component
public class MemberDAOMybatis implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//회원가입 메소드
	public void memberWrite(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.memberWrite", memberDTO);
	}
	
	//로그인 메소드
	public MemberDTO memberLogin(Map<String,String> map) {
		return sqlSession.selectOne("memberSQL.memberLogin", map);
	
	}
	
	//아이디 중복 체크
	public MemberDTO checkId(String m_Id) {
		return sqlSession.selectOne("memberSQL.memberCheckId", m_Id);
	}

	//아이디 찾기
	public MemberDTO findMemberId(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.findMemberId", map);
	}

	//임시비밀번호 수령 시, 회원의 비밀번호 변경
	public int changeTemPwd(Map<String,String> map) {
		return sqlSession.insert("memberSQL.changeTemPwd", map);
	}

	//이메일 중복체크
	public MemberDTO checkEmail(String m_Email) {
		return sqlSession.selectOne("memberSQL.checkEmail", m_Email);
	}

	//회원정보 수정
	public int memberModify(Map<String, String> map) {
		return sqlSession.update("memberSQL.memberModify", map);
	}
	
	//개인회원 탈퇴	
	public int deleteMember(Map<String, String> map) {
		return sqlSession.delete("memberSQL.deleteMember", map);
	}
	
	//회원의 예매 리스트를 가져오는 메소드
	public List<Book_performance_membersDTO> getMemberTicketList(Map<String, String> map) {
		return sqlSession.selectList("memberSQL.getMemberTicketList", map);
	}
	
	//회원의 예매 리스트를 가져오는 메소드
	public int getMemberTicketListTotalA(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.getMemberTicketListTotalA",map);
	}
	
	//연극 정보 가져오는 메소드
	public EventboardDTO getPerformanceInfo(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.getPerformanceInfo", map);
	}
	
	//전시회 정보 가져오는 메소드
	public EventboardDTO getExhibitionInfo(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.getExhibitionInfo", map);
	}
	
	//과거 예매내역 수 가져오는 메소드 
	public int getTicketHistoryListTotalA(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.getTicketHistoryListTotalA", map);
	}
	
	//과거 예매내역 가져오는 메소드
	public List<Book_performance_membersDTO> getTicketHistoryList(Map<String, String> map) {
		return sqlSession.selectList("memberSQL.getTicketHistoryList",map);
	}

	//연극 예매 취소
	public int cancelPerformance(Map<String, String> map) {
		return sqlSession.delete("memberSQL.cancelPerformance", map);
	}
	
	//연극 예매티켓 수정
	public int backPerformance(Map<String, String> map) {
		return sqlSession.update("memberSQL.backPerformance", map);
	}
	
	//전시회 예매 취소
	public int cancelExhibition(Map<String, String> map) {
		return sqlSession.delete("memberSQL.cancelExhibition", map);
		
	}
	
	//전시회 예매티켓 수정
	public int backExhibition(Map<String, String> map) {
		return sqlSession.update("memberSQL.backExhibition", map);
	}
	
	//개인회원 인증번호 발송 시, 회원의 아이디 및 이메일 일치 여부 확인
	public MemberDTO verifyNumEmailCheck(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.verifyNumEmailCheck", map);
		
	}
	
	//비지니스룸 내역 총 글수 가져오는 메소드
	public int getBusinessHistoryListTotalA(Map<String, String> map) {
		return sqlSession.selectOne("getBusinessHistoryListTotalA", map);
	}

	//마이페이지-비지니스룸 내역 불러오는 메소드(ajax)
	public List<SalesBusinessRoomDTO> getBusinessHistoryList(Map<String, String> map) {
		return sqlSession.selectList("getBusinessHistoryList",map);
	}
	
	//마이페이지-비지니스룸 삭제 메소드(ajax)
	public int deleteBusinessRoom(Map<String, String> map) {
		return sqlSession.delete("deleteBusinessRoom", map);
	}
	
	//전시회 예매 내역있는지 확인(개인회원 탈퇴 시,)
	public int checkBookExhibition(Map<String, String> map) {
		return sqlSession.selectOne("checkBookExhibition", map);
	}
	
	//연극 예매 내역있는지 확인(개인회원 탈퇴 시,)
	public int checkBookPlay(Map<String, String> map) {
		return sqlSession.selectOne("checkBookPlay", map);
	}
	
	//비지니스룸 예매 내역있는지 확인(개인회원 탈퇴 시,)
	public int checkBookBusiness(Map<String, String> map) {
		return sqlSession.selectOne("checkBookBusiness", map);
	}
	
	
}
