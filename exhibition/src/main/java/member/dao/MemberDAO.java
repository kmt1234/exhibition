package member.dao;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberDAO {

	public void memberWrite(MemberDTO memberDTO);	//회원가입 메소드 

	public MemberDTO memberLogin(Map<String,String> map);	//로그인 메소드

	public MemberDTO checkId(String m_Id);	//아이디 중복 체크 

	public MemberDTO findMemberId(Map<String, String> map); //아이디 찾기

	public int changeTemPwd(Map<String,String> map);	//임시비밀번호 수령시, 회원의 비밀번호 변경

	public MemberDTO checkEmail(String m_Email);	//이메일 중복 체크

	public int memberModify(Map<String, String> map);	//회원정보 수정
	

}
