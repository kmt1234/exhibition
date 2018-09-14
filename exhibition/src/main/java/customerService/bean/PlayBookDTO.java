package customerService.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class PlayBookDTO {
	String imageName;			//공연명
	Date playDate;              //공연일자(시작/종료)
	int playTicket;           	//일별 총 티켓 수
	int remainTicket;         	//일별 잔여 티켓 수
	int ticketPrice;        	//티켓 가격
	int bookTicket;      	    //예매된 티켓 수
	String bookMemberId;        //예매자 아이디
	char bookStatus; 			//구분자 (0:예매x, 1:예매완료)
}
