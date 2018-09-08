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
import org.springframework.web.method.support.ModelAndViewContainer;
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
	
	@RequestMapping(value="customerServiceInquireForm", method =  RequestMethod.GET)
	public String customerServiceForm() {
		return "/customerService/customerServiceInquireForm";
	}
	
	/*@RequestMapping(value="customerServiceInquire", method =  RequestMethod.POST)
	public ModelAndView customerServiceInquire(@RequestParam Map<String, String> map, HttpSession session) {
		String classify = (String)session.getAttribute("");
		return "";
	}*/
	//고객센터
	@RequestMapping(value="customerServiceMailConfirmForm", method =  RequestMethod.GET)
	public String customerServiceMailConfirmForm() {
		return "/customerService/customerServiceMailConfirmForm";
	}
	//고객의소리(이메일 인증)
		@RequestMapping(value="C_MailConfirm", method =  RequestMethod.GET)
		public String C_MailConfirm() {
			return "/customerService/C_MailConfirm";
		}
		//고객의소리(이메일 인증후 문의하기)
		@RequestMapping(value="C_Inquire", method =  RequestMethod.GET)
		public String C_nquire(@RequestParam String email, Model model) {
			model.addAttribute("email", email);
			return "/customerService/C_Inquire";
		}
		@RequestMapping(value="C_checkInquire", method =  RequestMethod.POST)
		public String C_checkInquire(@ModelAttribute CustomerServiceDTO customerServiceDTO) {
			customerServiceDAO.C_Inquire(customerServiceDTO);
			return "/main/index";
		}
		//자주묻는 질문
		@RequestMapping(value="C_QnA", method =  RequestMethod.GET)
		public String C_QnA() {
			return "/customerService/C_QnA";
		}
		//주요시설 연락처
		@RequestMapping(value="C_contactList", method =  RequestMethod.GET)
		public String C_contactList() {
			return "/customerService/C_contactList";
		}
		
		//인증번호 받기 위한 메일 전송
		@RequestMapping(value="sendEmail", method =  RequestMethod.POST)
		public @ResponseBody String sendEmail(@RequestParam final String email, Model model) {
			
			final String authNum = randomNum();
			
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("jbi8045@gmail.com");
					helper.setTo(email);
					helper.setSubject("인증번호 메일입니다.");
					helper.setText(authNum, true);
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
	//이미지 boardWriteForm
	@RequestMapping(value="C_mainImageboardForm",method=RequestMethod.GET)
	public String imageboardWriteForm() {
		return "/customerService/C_mainImageboardForm";
	}
	
	
	//이미지 boardWrite(*)
	@RequestMapping(value="C_imageboardWrite",method=RequestMethod.POST)
	public String imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
									@RequestParam MultipartFile img,
									Model model
									) {
		//경로 바꿔야함***
		String filePath ="D:\\Spring\\git\\exhibition\\exhibition\\src\\main\\webapp\\storage";
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
	public String imageboardListForm(@RequestParam(required=false , defaultValue="1") String pg, Model model) {
		
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
		return "/customerService/C_imageboardDelete";
	}
	
	//박람회,연극 정보 넣는 컨트롤러
	@RequestMapping(value="C_eventInfoWrite", method=RequestMethod.POST)
	public ModelAndView C_exhibitionInfoWrite(@ModelAttribute EventboardDTO eventboardDTO,@RequestParam MultipartFile img) {
		
		//경로 바꿔야함***
		String filePath ="D:\\Spring\\git\\exhibition\\exhibition\\src\\main\\webapp\\storage";
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
		
		mav.addObject("pg", pg);
		mav.addObject("imageboardPaging",imageboardPaging);
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
	
}
