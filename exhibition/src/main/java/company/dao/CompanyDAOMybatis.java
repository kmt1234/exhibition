package company.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import company.bean.CompanyDTO;
import rental.bean.ConcertHallDTO;
import rental.bean.ExhibitionDTO;

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

	public int deleteCompany(Map<String, String> map) {
		return sqlSession.delete("companySQL.deleteCompany", map);
		
	}
	
	//박람회 임대 리스트 불러오기
	public List<ExhibitionDTO> getExhibitionList(Map<String, String> map) {
		return sqlSession.selectList("companySQL.getExhibitionList", map);
	}
	
	//공연 임대 리스트 불러오기
	public List<ConcertHallDTO> getPlayList(Map<String, String> map) {
		return sqlSession.selectList("companySQL.getPlayList", map);
	}
	
	//모든 임대 리스트 불러오기
	public List<ExhibitionDTO> getAllRentalList(Map<String, String> map) {
		return sqlSession.selectList("companySQL.getAllRentalList",map);
	}
	
	//이전 임대 리스트 총갯수
	public int mypageRentalPastTotal(Map<String, String> map) {
		return sqlSession.selectOne("companySQL.mypageRentalPastTotal", map);
	}
	
	//임대한 박람회 부스 삭제
	public void deleteExBooth(Map<String, String> map) {
		sqlSession.delete("companySQL.deleteExBooth",map);
	}
	
	//임대한 콘서트 부스 삭제
	public void deleteCoBooth(Map<String, String> map) {
		sqlSession.delete("companySQL.deleteCoBooth",map);
	}


}
