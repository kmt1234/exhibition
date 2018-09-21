package rental.bean;

import lombok.Data;

@Data
public class RentalPerformanceDTO {
	private int years;
	private int months;
	private int days;
	private int endDay;
	private String title;
	private int code;
}
