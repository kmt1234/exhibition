package company.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import company.bean.CompanyDTO;

@Component
@Transactional
public class CompanyDAOMybatis implements CompanyDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//사업자 회원가입
	public void write(CompanyDTO companyDTO) {
		sqlSession.insert("companySQL.companyWrite", companyDTO); 
		
	}

	//사업자 로그인
	public CompanyDTO companyLogin(Map<String, String> map) {
		return sqlSession.selectOne("companySQL.companyLogin", map);
	}
	
	//중복체크
	public CompanyDTO checkId(String sNum) {
		return sqlSession.selectOne("companySQL.companyCheck", sNum);
	}

	public CompanyDTO checkEmail(Map<String, String> map) {
		return sqlSession.selectOne("companySQL.companyEmail", map);
	}
	
	//임시 비밀번호저장
	public int changeCpwd(Map<String, String> map) {
		return sqlSession.update("companySQL.changeCpwd", map);
	}

	public void modifyCompany(Map<String, String> map) {
		sqlSession.update("companySQL.modifyCompany", map);
	}


}
