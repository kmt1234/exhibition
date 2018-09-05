package rental.bean;

import lombok.Data;

@Data
public class ExhibitionDTO {
	String boothName;
	String C_license;
	String C_tel;
	String C_email;
	int totalRent;
	String code;
	String title;
	String startDate;
	String endDate;
}
