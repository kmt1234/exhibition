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
}
