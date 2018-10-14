package customerService.bean;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class SalesExhibitionDTO {
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
	private String yearMonth;
	

}

