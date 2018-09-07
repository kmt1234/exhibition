package customerService.bean;

import org.springframework.stereotype.Component;

import customerService.bean.ImageboardDTO;
import lombok.Data;

@Data
@Component
public class ImageboardDTO {
	private int seq;
	private String postSelect;	//분류
	private String imageName;	//제목
	private String image1;		//이미지 파일명
	private String eventDate1;	//날짜1
	private String eventDate2;	//날짜2
	private String eventLink;	//링크
}
