package member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

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
	
	
	
}
