package member.dao;

import java.util.List;
import java.util.Map;

import customerService.bean.EventboardDTO;
import member.bean.MemberDTO;
import performance.bean.Book_performance_membersDTO;

public interface MemberDAO {

	public void memberWrite(MemberDTO memberDTO);	//회원가입 메소드 

	public MemberDTO memberLogin(Map<String,String> map);	//로그인 메소드

	public MemberDTO checkId(String m_Id);	//아이디 중복 체크 

	public MemberDTO findMemberId(Map<String, String> map); //아이디 찾기

	public int changeTemPwd(Map<String,String> map);	//임시비밀번호 수령시, 회원의 비밀번호 변경

	public MemberDTO checkEmail(String m_Email);	//이메일 중복 체크

	public int memberModify(Map<String, String> map);	//회원정보 수정

	public int deleteMember(Map<String, String> map);	//회원탈퇴

	public List<Book_performance_membersDTO> getMemberTicketList(Map<String, String> map); //회원의 예매 리스트를 가져오는 메소드

	public int getMemberTicketListTotalA(Map<String, String> map);	//회원의 예매 리스트 수를 가져오는 메소드

	public EventboardDTO getPerformanceInfo(Map<String, String> map);	//연극 정보 가져오는 메소드

	public EventboardDTO getExhibitionInfo(Map<String, String> map);	//전시회 정보 가져오는 메소드

	public int getTicketHistoryListTotalA(Map<String, String> map);		//과거 예매내역 수 가져오는 메소드 

	public List<Book_performance_membersDTO> getTicketHistoryList(Map<String, String> map);	//과거 예매내역 가져오는 메소드

	public int cancelPerformance(Map<String, String> map);	//연극 예매 취소
	public int backPerformance(Map<String, String> map);	//연극 예매티켓 수정
	
	public int cancelExhibition(Map<String, String> map);	//전시회 예매 취소
	public int backExhibition(Map<String, String> map);		//전시회 예매티켓 수정

	public MemberDTO verifyNumEmailCheck(Map<String, String> map);	//개인회원 인증번호 발송 시, 회원의 아이디 및 이메일 일치 여부 확인

	
	

	

}
