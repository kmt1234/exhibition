package company.dao;

import java.util.List;
import java.util.Map;

import company.bean.CompanyDTO;
import rental.bean.ConcertHallDTO;
import rental.bean.ExhibitionDTO;

public interface  CompanyDAO {
	public void write(CompanyDTO companyDTO);

	public CompanyDTO companyLogin(Map<String, String> map); //기업회원 로그인

	public CompanyDTO checkId(String sNum);//사업자등록번호 체크

	public CompanyDTO checkEmail(Map<String, String> map);//비밀번호 찾을때 이메일 체크

	public int changeCpwd(Map<String, String> map);//임시비밀번호 저장

	public void modifyCompany(Map<String, String> map);//사업자정보수정

	public int deleteCompany(Map<String, String> map);//사업자 삭제

	public List<ExhibitionDTO> getExhibitionList(Map<String, String> map);//박람회 임대 리스트 불러오기

	public List<ConcertHallDTO> getPlayList(Map<String, String> map);//공연 임대 리스트 불러오기

	public List<ExhibitionDTO> getAllRentalList(Map<String, String> map);//모든 임대 리스트 불러오기

	public int mypageRentalPastTotal(Map<String, String> map);//이전 임대 리스트 총갯수

}
