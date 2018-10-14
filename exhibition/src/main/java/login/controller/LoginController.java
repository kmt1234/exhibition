package login.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.logging.SimpleFormatter;

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
import customerService.bean.EventboardDTO;
import customerService.bean.SalesBusinessRoomDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;
import member.dao.MemberTicketListPaging;
import performance.bean.Book_performance_membersDTO;
import rental.bean.ConcertHallDTO;
import rental.bean.ExhibitionDTO;

@RequestMapping(value = "login")
@Component
public class LoginController {

	private static final String SimpleFormatDate  = null;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private CompanyDAO companyDAO;
	@Autowired
	private JavaMailSenderImpl emailSender;
	@Autowired
	private Book_performance_membersDTO book_performance_membersDTO;
	@Autowired
	private MemberTicketListPaging memberTicketListPaging;
	@Autowired
	private SalesBusinessRoomDTO salesBusinessRoomDTO;

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
				String content = "안녕하세요 IPEC 전시회 관계자 입니다." + "해당 이메일 인증 번호는 아래와 같습니다." + "인증번호 : " + temPwd+123;

				helper.setFrom("jbi8045@gmail.com");
				helper.setTo(email);
				helper.setSubject(subject);
				helper.setText(content, true);
			}
		};

		emailSender.send(preparator);
		return temPwd+123;
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
	public ModelAndView mypage(@RequestParam(required = false, defaultValue = "1") String pg,HttpSession session) {
		int code = (Integer) session.getAttribute("code");
		Object DTO = session.getAttribute("homepageMember");
		session.setAttribute("DTO", DTO);
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String dateM = formatter.format(date);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("dateM", dateM);
		
		int totalA = companyDAO.mypageRentalPastTotal(map);
		ModelAndView mav = new ModelAndView();
		
		if (code == 1 || code == 3) {
			mav.addObject("display","/login/memberMypage.jsp");
			mav.setViewName("/customerService/C_customerServiceForm"); // 개인마이페이지
		} else if (code == 2) {
			mav.addObject("listSize",totalA);
			mav.addObject("pg",pg);
			mav.addObject("c_license", (String)session.getAttribute("C_license"));
			mav.addObject("display","/login/companyMypage.jsp");
			mav.setViewName("/customerService/C_customerServiceForm"); // 법인마이페이지	
		}

		return mav;
	}
	
	// 임대리스트ajax
	@RequestMapping(value = "getmypageRental", method = RequestMethod.POST)
	public ModelAndView getmypageRental(HttpSession session) {
		Object DTO = session.getAttribute("homepageMember");
		session.setAttribute("DTO", DTO);
		String C_license = (String) session.getAttribute("C_license");
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String dateM = formatter.format(date);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("C_license", C_license);
		map.put("dateM", dateM);

		List<ExhibitionDTO> list = companyDAO.getExhibitionList(map);
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setStartDate(list.get(i).getStartDate().substring(0, 10));
			list.get(i).setEndDate(list.get(i).getEndDate().substring(0, 10));
		}
		
		List<ConcertHallDTO> list2 = companyDAO.getPlayList(map);
		for(int i = 0; i < list2.size(); i++) {
			list2.get(i).setStartDate(list2.get(i).getStartDate().substring(0, 10));
			list2.get(i).setEndDate(list2.get(i).getEndDate().substring(0, 10));
		}

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		mav.addObject("list2",list2);
		mav.setViewName("jsonView");
		return mav;
	}

	// 임대내역ajax
	@RequestMapping(value = "getAllRental", method = RequestMethod.POST)
	public ModelAndView getAllRental(@RequestParam(required = false, defaultValue = "1") String pg,HttpSession session) {
		Object DTO = session.getAttribute("homepageMember");
		session.setAttribute("DTO", DTO);
		int endNum = Integer.parseInt(pg) * 10;
		int startNum = endNum - 9;

		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String dateM = formatter.format(date);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("dateM", dateM);
		
		int totalA = companyDAO.mypageRentalPastTotal(map);
		
		memberTicketListPaging.setCurrentPage(Integer.parseInt(pg));
		memberTicketListPaging.setPageBlock(3);
		memberTicketListPaging.setPageSize(10);
		memberTicketListPaging.setTotalA(totalA);
		memberTicketListPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		List<ExhibitionDTO> list = companyDAO.getAllRentalList(map);
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setStartDate(list.get(i).getStartDate().substring(0, 10));
			list.get(i).setEndDate(list.get(i).getEndDate().substring(0, 10));
		}

		mav.addObject("pg", pg);
		mav.addObject("memberTicketListPaging", memberTicketListPaging);
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//날짜비교
	@RequestMapping(value = "DateCompare", method = RequestMethod.POST)
	public @ResponseBody String DateCompare(@RequestParam String startDate,@RequestParam String endDate) {
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String dateM = formatter.format(date);
		startDate = startDate.replace("-", "");
		endDate = endDate.replace("-", "");
		int dateS = Integer.parseInt(dateM);
		int startDateS = Integer.parseInt(startDate);
		int endDateS = Integer.parseInt(endDate);
		
		if(startDateS<=dateS && dateS <=endDateS) {
			return "exist";
		}else {
			return "not_exist";
		}
	}
	
	@RequestMapping(value = "deleteGOGO", method = RequestMethod.POST)
	public ModelAndView deleteGOGO(@RequestParam String boothName,@RequestParam String title,@RequestParam String startDate,@RequestParam String endDate,HttpSession session) {
		startDate = startDate.replace("-", "/");
		endDate = endDate.replace("-", "/");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("boothName", boothName);
		map.put("title", title);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		companyDAO.deleteExBooth(map);
		companyDAO.deleteCoBooth(map);
		
		
		ModelAndView mav = new ModelAndView();

//		mav.addObject("display","/login/mypageRental.jsp");
//		mav.setViewName("/customerService/C_customerServiceForm"); // 임대리스트
		
		mav.setViewName("jsonView");
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
	
	//회원 예매리스트
	@RequestMapping(value="memerMypage_ticketList", method=RequestMethod.GET)
	public ModelAndView memerMypage_ticketList(@RequestParam(required = false, defaultValue = "1") String pg, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("display","/login/memberMypage_ticketList.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}
	
	//회원의 예매 리스트를 가져오는 ajax
	@RequestMapping(value="getMemberTicketList", method=RequestMethod.GET)
	public ModelAndView getMemberTicketList(@RequestParam(required = false, defaultValue = "1") String pg, 
											@RequestParam(required = false, defaultValue = "1") int code,
											HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("homepageMember");
		String id = memberDTO.getM_Id();
		
		//페이징 처리(5개씩 출력)	
		int endNum = Integer.parseInt(pg) * 10;
		int startNum = endNum - 9;

		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("id", id);
		
		int totalA = memberDAO.getMemberTicketListTotalA(map);
		
		memberTicketListPaging.setCurrentPage(Integer.parseInt(pg));
		memberTicketListPaging.setPageBlock(10);
		memberTicketListPaging.setPageSize(10);
		memberTicketListPaging.setTotalA(totalA);
		memberTicketListPaging.makePagingHTML();
		
		//DB
		List<Book_performance_membersDTO> list = new ArrayList<Book_performance_membersDTO>();
		list = memberDAO.getMemberTicketList(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("memberTicketListPaging", memberTicketListPaging);
		if(code != 3) {
			mav.setViewName("jsonView");
		}
		if(list==null) {
			mav.addObject("no_data", "no_data");
			return mav;
		} 
			return mav;
		} 
	
	
	//회원의 예매정보 상세보기
	@RequestMapping(value="eventDetail", method=RequestMethod.POST)
	public ModelAndView eventDetail(@RequestParam String memberId, @RequestParam String imageName, @RequestParam String playDate, @RequestParam String ticketQty) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("imageName", imageName);
		
		EventboardDTO eventboardDTO = null;
		
		//DB(연극)
		eventboardDTO = memberDAO.getPerformanceInfo(map);
		
		if(eventboardDTO==null) {
			//DB(전시회)
			eventboardDTO = memberDAO.getExhibitionInfo(map);
		}
		
		String playDate2=playDate.replace("-", "");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberId", memberId);
		mav.addObject("imageName", imageName);
		mav.addObject("playDate2", playDate2);
		mav.addObject("playDate", playDate);
		mav.addObject("ticketQty", ticketQty);
		mav.addObject("eventboardDTO", eventboardDTO);
		mav.addObject("display","/login/memberMypage_ticketInfo.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}
	
	//예매내역 이동
	@RequestMapping(value="ticketHistory", method=RequestMethod.GET)
	public ModelAndView ticketHistory(@RequestParam(required = false, defaultValue = "1") String pg, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("display","/login/memberMypage_ticketHistory.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}
	
	//과거 예매내역 가져오는 메소드(ajax) 
	@RequestMapping(value="getTicketHistory", method=RequestMethod.GET)
	public ModelAndView getTicketHistory(@RequestParam(required = false, defaultValue = "1") String pg, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("homepageMember");
		String id = memberDTO.getM_Id();
		
		//페이징 처리(5개씩 출력)	
		int endNum = Integer.parseInt(pg) * 10;
		int startNum = endNum - 9;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("id", id);
		
		int totalA = memberDAO.getTicketHistoryListTotalA(map);
		
		memberTicketListPaging.setCurrentPage(Integer.parseInt(pg));
		memberTicketListPaging.setPageBlock(10);
		memberTicketListPaging.setPageSize(10);
		memberTicketListPaging.setTotalA(totalA);
		memberTicketListPaging.makePagingHTML_past();
		
		//DB
		List<Book_performance_membersDTO> list = new ArrayList<Book_performance_membersDTO>();
		list = memberDAO.getTicketHistoryList(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("TicketHistoryListPaging", memberTicketListPaging);
		mav.setViewName("jsonView");
		
		if(list==null) {
			mav.addObject("no_data", "no_data");
			return mav;
		} 
		else {
			return mav;
		}
	}
	
	//예매 취소
	@RequestMapping(value="ticketCancel", method=RequestMethod.POST)
	public ModelAndView ticketCancel(@RequestParam String imageName, @RequestParam String playDate, @RequestParam String ticketQty, @RequestParam(required = false, defaultValue = "1") String pg, HttpSession session) {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("homepageMember");
		String id = memberDTO.getM_Id();
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("imageName", imageName);
		map.put("playDate", playDate);
		map.put("ticketQty", ticketQty);
		map.put("memberId", id);
		
		//DB
		int resultPD = memberDAO.cancelPerformance(map);	//연극 예매 취소
		int resultPC = memberDAO.backPerformance(map);	//연극 예매티켓 수정
		
		//연극취소 아니라면 전시회 취소
		if(resultPD==0 || resultPC==0) {
			int resultED = memberDAO.cancelExhibition(map);	//전시회 예매 취소
			int resultEC = memberDAO.backExhibition(map);	//전시회 예매티켓 수정
			
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("display","/login/memberMypage.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}
	
	//마이페이지-비지니스룸 내역 리스트 페이지
		@RequestMapping(value="memberBusinessRoomList", method=RequestMethod.GET)
		public ModelAndView memberBusinessRoomList(@RequestParam(required = false, defaultValue = "1") String pg) {
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("pg", pg);
			mav.addObject("display","/login/memberMypage_business.jsp");
			mav.setViewName("/customerService/C_customerServiceForm");
			return mav;
		}
		
		//마이페이지-비지니스룸 내역 불러오는 메소드(ajax)
		@RequestMapping(value="memberBusinessRoom", method=RequestMethod.GET)
		public ModelAndView memberBusinessRoom(@RequestParam(required = false, defaultValue = "1") String pg, HttpSession session) {
			
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("homepageMember");
			String id = memberDTO.getM_Id();
			
			//페이징 처리(5개씩 출력)	
			int endNum = Integer.parseInt(pg) * 3;
			int startNum = endNum - 2;
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");
			map.put("M_Id", id);
			
			int totalA = memberDAO.getBusinessHistoryListTotalA(map);
			
			memberTicketListPaging.setCurrentPage(Integer.parseInt(pg));
			memberTicketListPaging.setPageBlock(2);
			memberTicketListPaging.setPageSize(3);
			memberTicketListPaging.setTotalA(totalA);
			memberTicketListPaging.makePagingHTML_business();
			
			//DB
			List<SalesBusinessRoomDTO> list = new ArrayList<SalesBusinessRoomDTO>();
			list = memberDAO.getBusinessHistoryList(map);
			
			for(int i=0; i<list.size(); i++) {
				list.get(i).setStartDate(list.get(i).getStartDate().substring(0, 10));
			}
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("pg", pg);
			mav.addObject("memberBuisnessListPaging", memberTicketListPaging);
			mav.addObject("list", list);
			mav.setViewName("jsonView");
			return mav;
		}
		
		//마이페이지-비지니스룸 예약 취소(진행중_**)
		@RequestMapping(value="memberBusinessRoomCancel", method=RequestMethod.GET)
		public @ResponseBody String memberBusinessRoomCancel(@RequestParam(required = false, defaultValue = "1") String pg, @RequestParam String seq ,HttpSession session) {
			
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("homepageMember");
			String id = memberDTO.getM_Id();
			
			Map<String,String> map = new HashMap<String, String>();
			map.put("M_Id", id);
			map.put("seq", seq);
			
			//DB
			int result = memberDAO.deleteBusinessRoom(map);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("pg", pg);
			mav.setViewName("jsonView");
			
			if(result > 0) {
				return "deleteOk";
			}else {
				return "deleteFail";
			}
			
			
		}
	
}
