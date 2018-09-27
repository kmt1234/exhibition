package rental.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ExhibitionDTO {
	private String boothName;
	private String C_license;
	private String C_tel;
	private String C_email;
	private int totalRent;
	private String code;
	private String title;
	private String startDate;
	private String endDate;
	private String[] days;
	private int daysSize;
	private int saleDays;
	
	
}
