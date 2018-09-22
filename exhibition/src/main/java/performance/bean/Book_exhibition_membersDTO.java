package performance.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Book_exhibition_membersDTO {
	private int seq;
	private String imageName;
	private String playDate;
	private String memberId;
	private String ticketQty;
}
