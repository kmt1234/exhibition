package customerService.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import customerService.bean.CustomerServiceDTO;
import customerService.bean.EventboardDTO;
import customerService.bean.ImageboardDTO;
import customerService.bean.ImageboardPaging;
import customerService.dao.CustomerServiceDAO;

@RequestMapping(value="customerService")
@Component
public class CustomerServiceController {
	@Autowired
	private CustomerServiceDAO customerServiceDAO;
	@Autowired
	private JavaMailSenderImpl emailSender;
	@Autowired
	private ImageboardPaging imageboardPaging;
	
	//고객센터
	@RequestMapping(value="C_infoForm", method =  RequestMethod.GET)
	public String C_infoForm() {
		return "/customerService/C_infoForm";
	}
	
	//공지사항
	@RequestMapping(value="C_noticeForm", method =  RequestMethod.GET)
	public String C_noticeForm() {
		return "/customerService/C_noticeForm";
	}
	
	
	//공지사항 리스트
	@RequestMapping(value="getNoticeList", method=RequestMethod.POST)
	public ModelAndView getNoticeList() {
				
		List<CustomerServiceDTO> list = customerServiceDAO.getNoticeList();
		
		for(CustomerServiceDTO dto : list) {
			System.out.println(dto);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	//공지사항 뷰
	@RequestMapping(value="C_noticeView", method = RequestMethod.GET)
	public String C_noticeView(@RequestParam String seq, Model model) {
		System.out.println(seq);
		
		CustomerServiceDTO customerServiceDTO = customerServiceDAO.getInfo(seq);
		
		model.addAttribute("customerServiceDTO",customerServiceDTO);
		return "/customerService/C_noticeViewForm";
	}
	
	//공지사항 - 작성하기
	@RequestMapping(value="C_notice_WriteForm", method =  RequestMethod.GET)
	public String C_notice_WriteForm() {
		return "/customerService/C_notice_WriteForm";
	}
	//공지사항 - 작성하기 등록
	@RequestMapping(value="C_notice_Write", method =  RequestMethod.POST)
	public ModelAndView C_notice_Write(@RequestParam String subject, @RequestParam String content) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("subject", subject);
		map.put("content", content);
		//DB
		customerServiceDAO.C_notice_Write(map);
		return new ModelAndView("redirect:/customerService/C_noticeForm.do");
	}
	@RequestMapping(value="C_notice_ModifyForm", method =  RequestMethod.GET)
	public String C_notice_ModifyForm(@RequestParam String seq, Model model) {
		CustomerServiceDTO customerServiceDTO = customerServiceDAO.getInfo(seq);
		
		model.addAttribute("customerServiceDTO",customerServiceDTO);
		
		return "/customerService/C_notice_ModifyForm";
	}
	//공지사항 수정 버튼
	@RequestMapping(value="C_notice_Modify", method =  RequestMethod.POST)
	public String C_notice_Modify(@RequestParam String seq, @RequestParam String subject, @RequestParam String content) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq", seq);
		map.put("subject", subject);
		map.put("content", content);
		customerServiceDAO.C_notice_Modify(map);
		
		return "/customerService/C_noticeForm";
	}
	//공지사항 삭제
	@RequestMapping(value="C_notice_Delete", method =  RequestMethod.GET)
	public String C_notice_Delete(@RequestParam String seq) {
		customerServiceDAO.C_notice_Delete(seq);
		return "/customerService/C_noticeForm";
	}
	//고객의소리(이메일 인증)
	@RequestMapping(value="C_emailConfirmForm", method =  RequestMethod.GET)
	public String C_emailConfirmForm() {
		return "/customerService/C_emailConfirmForm";
	}
	@RequestMapping(value="sendEmail", method =  RequestMethod.POST)
	public @ResponseBody String sendEmail(@RequestParam final String email, Model model) {//인증번호 받기 위한 메일 전송
		
		final String authNum = randomNum();
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				
				String subject = "[IPEC 전시회 이메일 인증 안내 입니다]";
				String content = "안녕하세요 IPEC 전시회 관계자 입니다./n"
						+ "해당 이메일 인증 번호는 아래와 같습니다./n"
						+ "인증번호 : "+authNum;
				
				helper.setFrom("jbi8045@gmail.com");
				helper.setTo(email);
				helper.setSubject("인증번호 메일입니다.");
				helper.setText(content, true);
			}
		};
		
		emailSender.send(preparator);
		return authNum;
	}

	private String randomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	//고객의소리(이메일 인증후 문의하기)
	@RequestMapping(value="C_inquireForm", method =  RequestMethod.GET)
	public String C_inquire(@RequestParam String email, Model model) {
		model.addAttribute("email", email);
		return "/customerService/C_inquireForm";
	}
	//고객의소리 (이메일 인증 등록)
	@RequestMapping(value="C_checkInquire", method =  RequestMethod.POST)
	public String C_checkInquire(@ModelAttribute CustomerServiceDTO customerServiceDTO) {
		customerServiceDAO.C_inquire(customerServiceDTO);
		return "/main/index";
	}
	//고객의소리 리스트(관리자)
	@RequestMapping(value="getInquireList", method=RequestMethod.POST)
	public ModelAndView getInquireList() {
				
		List<CustomerServiceDTO> list = customerServiceDAO.getInquireList();
		
		for(CustomerServiceDTO dto : list) {
			System.out.println(dto);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	//고객의소리 내용보기(관리자
	@RequestMapping(value="C_inqureView", method = RequestMethod.GET)
	public String C_inqureView(@RequestParam String seq, Model model) {
		System.out.println(seq);
		
		CustomerServiceDTO customerServiceDTO = customerServiceDAO.getInquireInfo(seq);
		
		model.addAttribute("customerServiceDTO",customerServiceDTO);
		return "/customerService/C_inquireViewForm";
	}
	//고객의 소리 답변(관리자)
//	@RequestMapping(value="sendEmail", method =  RequestMethod.POST)
//	public @ResponseBody String sendEmail(@RequestParam  String subject ,@RequestParam String content, @RequestParam String email,Model model) {//인증번호 받기 위한 메일 전송
//		
//		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
//			public void prepare(MimeMessage mimeMessage) throws Exception {
//				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
//				
//				String subject = subject;
//				String content = content;
//				
//				helper.setFrom("jbi8045@gmail.com");
//				helper.setTo(email);
//				helper.setSubject("인증번호 메일입니다.");
//				helper.setText(content, true);
//			}
//		};
//		
//		emailSender.send(preparator);
//		return authNum;
//	}
	//자주묻는 질문
	@RequestMapping(value="C_QnAForm", method =  RequestMethod.GET)
	public String C_QnAForm() {
		return "/customerService/C_QnAForm";
	}
	//
	@RequestMapping(value="getQnAList", method=RequestMethod.POST)
	public ModelAndView getQnAList() {
				
		List<CustomerServiceDTO> list = customerServiceDAO.getQnAList();
		
		for(CustomerServiceDTO dto : list) {
			System.out.println(dto);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	//자주묻는 질문 - 작성 
	@RequestMapping(value="C_QnA_WriteForm", method =  RequestMethod.GET)
	public String C_QnA_WriteForm() {
		return "/customerService/C_QnA_WriteForm";
	}
	//자주묻는 질문 - 작성등록
	@RequestMapping(value="C_QnA_Write", method =  RequestMethod.POST)
	public String C_QnA_Write(@RequestParam String subject, @RequestParam String content) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("subject", subject);
		map.put("content", content);
		//DB
		customerServiceDAO.C_QnA_Write(map);
		return "/customerService/C_QnA_WriteForm";
	}
	//주요시설 연락처
	@RequestMapping(value="C_contactListForm", method =  RequestMethod.GET)
	public String C_contactListForm() {
		return "/customerService/C_contactListForm";
	}
	
	@RequestMapping(value="getContactList", method=RequestMethod.POST)
	public ModelAndView getContactList() {
				
		List<CustomerServiceDTO> list = customerServiceDAO.getContactList();
		
		for(CustomerServiceDTO dto : list) {
			System.out.println(dto);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	//주요시설 연락처 - 작성
	@RequestMapping(value="C_contactList_WriteForm", method =  RequestMethod.GET)
	public String C_contactList_WriteForm() {
		return "/customerService/C_contactList_WriteForm";
	}
	//주요시설 연락처 - 작성등록
	@RequestMapping(value="C_contactList_Write", method =  RequestMethod.POST)
	public String C_contactList_Write(@RequestParam String classify, @RequestParam String agency, @RequestParam String name, @RequestParam String contact) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("classify", classify);
		map.put("agency", agency);
		map.put("name", name);
		map.put("contact", contact);
		//DB
		customerServiceDAO.C_contactList_Write(map);
		return "/customerService/C_contactList_WriteForm";
	}
	
	
	@RequestMapping(value="C_inquire_List", method=RequestMethod.GET)
	public String C_inquire_List() {
		return "/customerService/C_inquire_ListForm";
	}
	
	
	//이미지 boardWriteForm
	@RequestMapping(value="C_mainImageboardForm",method=RequestMethod.GET)
	public String imageboardWriteForm() {
		return "/customerService/C_mainImageboardForm";
	}
	//이미지 boardWrite
	@RequestMapping(value="C_imageboardWrite",method=RequestMethod.POST)
	public String imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
									@RequestParam MultipartFile img,
									Model model
									) {
		//경로 바꿔야함***
		String filePath ="D:\\morning_project_no_remove\\repository\\exhibition\\exhibition\\src\\main\\webapp\\storage";
		String fileName = img.getOriginalFilename();
		
		File file = new File(filePath,fileName);	

		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		imageboardDTO.setImage1(fileName);
		//DB			
		customerServiceDAO.imageboardWrite(imageboardDTO);
		model.addAttribute("imageboardDTO",imageboardDTO);
		return "/customerService/C_imageboardWrite";
	}
	
	//이미지보드 리스트
	@RequestMapping(value="C_mainImageboardListForm",method=RequestMethod.GET)
	public String imageboardListForm(@RequestParam(required=false , defaultValue="1") String pg,
								Model model) {
		
		model.addAttribute("pg",pg);
		return "/customerService/C_mainImageboardListForm";
	}
	
	//이미지보드 리스트
	@RequestMapping(value="getImageboardList",method=RequestMethod.POST)
	public ModelAndView getImageboardList(@RequestParam(required=false , defaultValue="1") String pg) {
		
		int endNum = Integer.parseInt(pg)*3;
		int startNum = endNum-2;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		int totalA = customerServiceDAO.getImageboardTotalA();

		imageboardPaging.setCurrentPage(Integer.parseInt(pg));
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);

		imageboardPaging.makePagingHTML();

		imageboardPaging.makePagingHTML();
		
		List<ImageboardDTO> list = customerServiceDAO.imageboardList(map);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("list",list);
		mav.addObject("imageboardPaging",imageboardPaging);
		
		mav.addObject("/customerService/C_imageboardList.jsp");
		mav.setViewName("jsonView");
		return mav;
	}
	//이미지보드 삭제
	@RequestMapping(value="C_imageboardDelete",method=RequestMethod.POST)
	public String imageboardDelete(@RequestParam String[] check,
									Model model) {
		
		List<Integer> list = new ArrayList<Integer>();
		for(String seq : check) {
			list.add(Integer.parseInt(seq));
		}
		
		customerServiceDAO.imageboardDelete(list);
		return "/customerService/C_mainImageboardListForm";
	}
	//박람회 정보 넣는 컨트롤러
	@RequestMapping(value="C_eventInfoWrite", method=RequestMethod.POST)
	public ModelAndView C_exhibitionInfoWrite(@ModelAttribute EventboardDTO eventboardDTO,@RequestParam MultipartFile img) {
		
		//경로 바꿔야함***
		String filePath ="D:\\morning_project_no_remove\\repository\\exhibition\\exhibition\\src\\main\\webapp\\storage";
		String fileName = img.getOriginalFilename();
		
		File file = new File(filePath,fileName);	

		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		eventboardDTO.setImage1(fileName);			

		//DB
		customerServiceDAO.eventInfoWrite(eventboardDTO);
		
		return new ModelAndView("redirect:/main/index.do");
	}
	
	
	//연극 정보 넣는 컨트롤러
	@RequestMapping(value="C_eventInfoWrite_play", method=RequestMethod.POST)
	public ModelAndView C_exhibitionInfoWrite_play(@ModelAttribute EventboardDTO eventboardDTO,@RequestParam MultipartFile img) {
		
		//경로 바꿔야함***
		String filePath ="D:\\morning_project_no_remove\\repository\\exhibition\\exhibition\\src\\main\\webapp\\storage";
		String fileName = img.getOriginalFilename();
		
		File file = new File(filePath,fileName);	

		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		eventboardDTO.setImage1(fileName);			

		//DB
		customerServiceDAO.eventInfoWrite_play(eventboardDTO);
		
		return new ModelAndView("redirect:/main/index.do");
	}

		
	//이미지 슬라이드 가져오는 컨트롤러
	@RequestMapping(value="getImageboardSlide", method=RequestMethod.GET)
	public ModelAndView getImageboardSlide() {
		
		//DB
		List<ImageboardDTO> list = customerServiceDAO.getImageboardSlide();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//박람회 업로드 리스트 폼
	@RequestMapping(value="C_eventboardListForm", method=RequestMethod.GET)
	public ModelAndView C_exhibitionboardList(@RequestParam(required=false , defaultValue="1") String pg) {
		
		int endNum = Integer.parseInt(pg)*3;
		int startNum = endNum-2;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		int totalA = customerServiceDAO.getEventboardTotalA();

		imageboardPaging.setCurrentPage(Integer.parseInt(pg));
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);

		imageboardPaging.eventMakePagingHTML();
		
		
		List<EventboardDTO> list = customerServiceDAO.eventboardList(map);
		
		ModelAndView mav = new ModelAndView();
		
		
		for(EventboardDTO dto : list) {
			System.out.println(dto.getImageName());
		}
		
		mav.addObject("pg", pg);
		mav.addObject("imageboardPaging",imageboardPaging);
		mav.addObject("listSize", list.size()+"");
		mav.addObject("list", list);
		mav.setViewName("/customerService/C_eventboardListForm");
		return mav;
	}	
	
	//박람회 업로드 리스트 삭제
	@RequestMapping(value="C_eventboardDelete", method=RequestMethod.POST)
	public ModelAndView C_eventboardDelete(@RequestParam String[] check) {
		
		List<Integer> list = new ArrayList<Integer>();
		for(String seq : check) {
			list.add(Integer.parseInt(seq));
		}
		
		//DB
		customerServiceDAO.eventboardDelete(list);
		
		return new ModelAndView("redirect:/customerService/C_eventboardListForm.do");
	}
	
	//연극 업로드 리스트 폼
	@RequestMapping(value="C_eventboardList_playForm", method=RequestMethod.GET)
	public ModelAndView C_eventboardList_playForm(@RequestParam(required=false , defaultValue="1") String pg) {
		
		int endNum = Integer.parseInt(pg)*3;
		int startNum = endNum-2;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		int totalA = customerServiceDAO.getEventboardTotalA_play();

		imageboardPaging.setCurrentPage(Integer.parseInt(pg));
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);

		imageboardPaging.eventMakePagingHTML();
		
		//DB
		List<EventboardDTO> list = customerServiceDAO.eventboardList_play(map);
				
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pg", pg);
		mav.addObject("imageboardPaging",imageboardPaging);
		mav.addObject("list", list);
		mav.setViewName("/customerService/C_eventboardList_playForm");
		return mav;
	}
	
	//연극 업로드 리스트 삭제
	@RequestMapping(value="C_eventboardDelete_play", method=RequestMethod.POST)
	public ModelAndView C_eventboardDelete_play(@RequestParam String[] check) {
		
		List<Integer> list = new ArrayList<Integer>();
		for(String seq : check) {
			list.add(Integer.parseInt(seq));
		}
		
		//DB
		customerServiceDAO.eventboardDelete_play(list);
		
		return new ModelAndView("redirect:/customerService/C_eventboardList_playForm.do");
	}
}
	

