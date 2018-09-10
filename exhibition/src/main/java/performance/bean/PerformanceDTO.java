package performance.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PerformanceDTO {
	String code;
	String title;
	String startDate;
	String endDate;
	String[] days;
	int daysSize;
	int size;
}
