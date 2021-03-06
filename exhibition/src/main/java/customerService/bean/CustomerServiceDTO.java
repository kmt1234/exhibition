package customerService.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class CustomerServiceDTO {
	private int seq;			//seq
	private String email;		//이메일
	private String classify;	//분류
	private String name;		//이름
	private String tel;			//전화번호
	private String subject;		//제목
	private String content;		//내용
	
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date logtime;		//등록일 
}