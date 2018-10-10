package customerService.bean;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class SalesBusinessRoomDTO {
	private String seq;
	private String roomName;
	private String M_Id;
	private String M_Email;
	private int numberPeople;
	private int totalRent;
	private String startDate;
	private String first;
	private String second;
	private String third;
	private String fourth;
	private String yearMonth;
}

