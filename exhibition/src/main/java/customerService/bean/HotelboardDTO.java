package customerService.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class HotelboardDTO {
	private int seq;
	private String postSelect;  //분류번호(3)
	private String imageName;   //제목
	private String image1;	    //이미지파일
	private String eventLink;	//링크
	private String eventPlace;	//TEL

}
