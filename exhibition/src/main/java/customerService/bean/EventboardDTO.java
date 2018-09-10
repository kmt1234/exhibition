package customerService.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class EventboardDTO {			//박람회,연극  DTO 
	private int seq;
	private String postSelect;			//분류(1:박람회 2:연극)
	private String imageName;			//제목
	private String image1;				//이미지 파일명
	private String startDate;			//날짜1(시작일)
	private String endDate;				//날짜2(종료일)
	private String eventLink;			//링크
	private String startTime;			//시간1(시작시간)
	private String endTime;				//시간2(종료시간)
	private String eventPlace;			//장소(박람회,연극)
	private String eventPrice;			//가격(박람회,연극)
	private String eventSeats = null;	//관람좌석(연극)
	private String eventRate = null;	//관람등급(연극)
	private String eventContent;		//소개글(간단한 정보)
}
