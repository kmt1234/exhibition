package company.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class CompanyDTO {
	private String C_businessname; //사업자명
	private String C_license; //사업자등록번호
	private String C_password; //비밀번호
	private String C_corporate; //법인번호
	private String C_condition; //업태
	private String C_postnumbox;//우편번호
	private String C_address1; //주소1
	private String C_address2; //주소2
	private String C_representative; //대표자
	private String C_tel; //전화번호
	private String C_email; //이메일
	private int code; //코드번호
	
	@Override
	public String toString() {
		return String.valueOf(code);
	}
}
