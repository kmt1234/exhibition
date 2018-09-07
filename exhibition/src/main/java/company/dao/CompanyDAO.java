package company.dao;

import java.util.Map;

import company.bean.CompanyDTO;

public interface  CompanyDAO {
	public void write(CompanyDTO companyDTO);

	public CompanyDTO companyLogin(Map<String, String> map); //기업회원 로그인

	public CompanyDTO checkId(String sNum);//사업자등록번호 체크

	public CompanyDTO checkEmail(Map<String, String> map);//비밀번호 찾을때 이메일 체크

	public int changeCpwd(Map<String, String> map);//임시비밀번호 저장

}
