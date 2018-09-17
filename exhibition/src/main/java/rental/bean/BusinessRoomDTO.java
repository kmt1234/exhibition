package rental.bean;

import lombok.Data;

@Data
public class BusinessRoomDTO {
	private String roomName;
	private String M_Id;
	private String M_Email;
	private String startDate;
	private String first;
	private String second;
	private String third;
	private String fourth;
	private int totalRent;
}
