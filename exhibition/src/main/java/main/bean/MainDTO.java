package main.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class MainDTO {
	private int seq;			//seq
	private String email;		//이메일
	private String classify;	//분류
	private String name;		//이름
	private String phone;		//전화번호
	private String subject;		//제목
	private String content;		//내용
	private String facility;	//기관&시설
	private String title;		//명칭
	private String index_keyword;
	
	private int postselect;
	private String imagename;
	private String image1;
	private String eventlink;
	private String starttime;
	private String endtime;
	private String eventplace;
	private String eventprice;
	private String eventseats;
	private String eventrate;
	private String eventcontent;
	
	
	private int ref;			//그룹번호
    private int lev;			//단계
    private int step;			//글순서
    private int pseq;			//원글번호
    private int reply;			//답변수
 
    private int hit;			//조회수
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date startdate;
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date enddate;
}