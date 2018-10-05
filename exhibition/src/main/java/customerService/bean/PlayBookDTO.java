package customerService.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class PlayBookDTO {
	private int num;
	private String imageName;			//공연명
	private Date playDate;              //공연일자(시작/종료)
	private int playTicket;           	//일별 총 티켓 수
	private int remainTicket;         	//일별 잔여 티켓 수
	private int ticketPrice;        	//티켓 가격
	private int bookTicket;      	    //예매된 티켓 수
	private String bookMemberId;        //등록한 아이디
	private char bookStatus; 			//구분자 (0:예매x, 1:예매완료)
}
