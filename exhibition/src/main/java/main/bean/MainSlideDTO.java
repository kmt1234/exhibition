package main.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MainSlideDTO {
	private String imageName;	
	private String eventLink;	
}
