package customerService.controller;

import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;

import customerService.bean.CustomerServiceDTO;
import customerService.dao.CustomerServiceDAO;

@RequestMapping(value="customerService")
@Component
public class CustomerServiceController {
	@Autowired
	private CustomerServiceDAO customerServiceDAO;
	@Autowired
	private JavaMailSenderImpl emailSender;
	
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
	
	//개인정
		@RequestMapping(value="C_personalInformation", method =  RequestMethod.GET)
		public String C_personalInformation() {
			return "/customerService/C_personalInformation";
		}
	
}
