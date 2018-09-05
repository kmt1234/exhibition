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
}
