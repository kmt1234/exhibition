package performance.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Book_performance_membersDTO {
	private String imageName;
	private String playDate;
	private String memberId;
	private String ticketQty;
}
