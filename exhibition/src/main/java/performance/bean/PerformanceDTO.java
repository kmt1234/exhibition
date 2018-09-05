package performance.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PerformanceDTO {
	private int years;
	private int months;
	private int days;
	private int endDay;
	private String title;
	private int code;
}
