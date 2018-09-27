package rental.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ConcertHallDTO {
	private String hallName;
	private String C_license;
	private String C_tel;
	private String C_email;
	private int totalRent;
	private String title;
	private String startDate;
	private String endDate;
	private String[] days;
	private int daysSize;
	private int saleDays;
}
