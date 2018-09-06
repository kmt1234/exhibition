package company.dao;

import java.util.Map;

import company.bean.CompanyDTO;

public interface  CompanyDAO {
	public void write(CompanyDTO companyDTO);

	public CompanyDTO companyLogin(Map<String, String> map); //기업회원 로그인

	public CompanyDTO checkId(String sNum);

}
