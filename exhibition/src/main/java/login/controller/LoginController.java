package login.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import company.bean.CompanyDTO;
import company.dao.CompanyDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@RequestMapping(value = "login")
@Component
public class LoginController {

	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private CompanyDAO companyDAO;
	@Autowired
	private JavaMailSenderImpl emailSender;

	// 개인회원-로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public @ResponseBody String login(@RequestParam String M_Id, @RequestParam String M_Pwd, HttpSession session) {
		// 회원가입 축하 메세지 삭제
		session.removeAttribute("registerMessage");

		// 데이터 싣기
		Map<String, String> map = new HashMap<String, String>();
		map.put("M_Id", M_Id);
		map.put("M_Pwd", M_Pwd);

		// DB
		MemberDTO memberDTO = memberDAO.memberLogin(map);

		if (memberDTO == null)
			return "not_exist";
		else {
			// 세션 설정
			System.out.println("아이디 : " + memberDTO.getM_Id() + " 로그인 성공");

			session.setAttribute("homepageMember", memberDTO); // 회원 전체 정보
			session.setAttribute("homepageMemberName", memberDTO.getM_Id()); // 회원 이름
			session.setAttribute("code", memberDTO.getCode()); // 코드 정보 넣어야함(1은 개인)
			return "exist";
		}
	}

	// 기업회원 로그인
	@RequestMapping(value = "Clogin", method = RequestMethod.POST)
	public @ResponseBody String Clogin(@RequestParam String C_license, @RequestParam String C_password,
			HttpSession session) {
		// 회원가입 축하 메세지 삭제
		session.removeAttribute("registerMessage");

		// 데이터 싣기
		Map<String, String> map = new HashMap<String, String>();
		map.put("C_license", C_license);
		map.put("C_password", C_password);

		// DB
		CompanyDTO companyDTO = companyDAO.companyLogin(map);

		if (companyDTO == null)
			return "not_exist";
		else {
			// 세션 설정
			System.out.println("기업명 : " + companyDTO.getC_businessname() + " 로그인 성공");
			session.setAttribute("homepageMemberName", companyDTO.getC_license());
			session.setAttribute("homepageMember", companyDTO); // 회원 전체 정보
			session.setAttribute("code", companyDTO.getCode());
			session.setAttribute("C_license", companyDTO.getC_license());
			session.setAttribute("C_email", companyDTO.getC_email());
			session.setAttribute("C_tel", companyDTO.getC_tel());
			return "exist";
		}
	}

	// 로그아웃(공통)
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {

		// 세션제거
		session.invalidate();

		return new ModelAndView("redirect:/main/index.do");
	}

	// 비밀번호 찾기(임시 비밀번호 이메일 발송)
	@RequestMapping(value = "sendEmail", method = RequestMethod.POST)
	public @ResponseBody String sendEmail(@RequestParam final String email, Model model) {// 인증번호 받기 위한 메일 전송

		final String temPwd = temporaryPassword(8);

		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

				String subject = "임시비밀번호입니다";
				String content = "안녕하세요 IPEC 전시회 관계자 입니다./n" + "해당 이메일 인증 번호는 아래와 같습니다./n" + "인증번호 : " + temPwd;

				helper.setFrom("jbi8045@gmail.com");
				helper.setTo(email);
				helper.setSubject(subject);
				helper.setText(content, true);
			}
		};

		emailSender.send(preparator);
		return temPwd;
	}

	// 임시비밀번호 생성하는 메소드
	public static String temporaryPassword(int size) {

		StringBuffer buffer = new StringBuffer();

		Random random = new Random();

		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9"
				.split(",");

		for (int i = 0; i < size; i++) {

			buffer.append(chars[random.nextInt(chars.length)]);

		}

		return buffer.toString();

	}

	// 임시비밀번호 수령 시, 회원의 비밀번호 변경
	@RequestMapping(value = "changeTemPwd", method = RequestMethod.POST)
	public @ResponseBody String changePwd(@RequestParam String temPwd, @RequestParam String M_Id) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("M_Pwd", temPwd);
		map.put("M_Id", M_Id);

		// DB
		int result = memberDAO.changeTemPwd(map);

		if (result == 1)
			return "1";
		else
			return "0";
	}

	// 마이페이지
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public ModelAndView mypage(HttpSession session) {

		int code = (Integer) session.getAttribute("code");

		Object DTO = session.getAttribute("homepageMember");
		session.setAttribute("DTO", DTO);

		ModelAndView mav = new ModelAndView();

		if (code == 1) {
			mav.setViewName("/customerService/C_personalInformationForm"); // 개인마이페이지
		} else if (code == 2) {
			mav.setViewName("/customerService/C_companyInformationForm"); // 법인마이페이지
		}

		return mav;
	}

	// 임시비밀번호 수령 시, 사업자등록번호의 비밀번호 변경
	@RequestMapping(value = "changeCpwd", method = RequestMethod.POST)
	public @ResponseBody String changeCpwd(@RequestParam String temPwd2, @RequestParam String C_license) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("C_license", C_license);
		map.put("C_password", temPwd2);

		// DB
		int result = companyDAO.changeCpwd(map);

		if (result == 1)
			return "1";
		else
			return "0";
	}

}
