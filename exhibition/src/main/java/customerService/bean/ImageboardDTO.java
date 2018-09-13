package customerService.bean;

import org.springframework.stereotype.Component;

import customerService.bean.ImageboardDTO;
import lombok.Data;

@Data
@Component
public class ImageboardDTO {
	private int seq;
	private String imageName;
	private String image1;
	private String postSelect;
	private String startDate;			//날짜1(시작일)
	private String endDate;				//날짜2(종료일)
	private String eventLink;			//링크
	private String eventContent;		//소개글(간단한 정보)
	private String code;
}
