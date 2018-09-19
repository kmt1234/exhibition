package customerService.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

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
import customerService.bean.CustomerServicePaging;
import customerService.bean.EventboardDTO;
import customerService.bean.HotelboardDTO;
import customerService.bean.ImageboardDTO;
import customerService.bean.ImageboardPaging;
import customerService.bean.PlayBookDTO;
import customerService.bean.SalesExhigitionDTO;
import customerService.dao.CustomerServiceDAO;
import member.bean.MemberDTO;

@RequestMapping(value = "customerService")
@Component
public class CustomerServiceController {
	@Autowired
	private CustomerServiceDAO customerServiceDAO;
	@Autowired
	private JavaMailSenderImpl emailSender;
	@Autowired
	private ImageboardPaging imageboardPaging;
	private String filePath = "C:\\Users\\user\\git\\exhibition\\exhibition\\src\\main\\webapp\\storage\\";
	@Autowired
	private CustomerServicePaging customerServicePaging;
	@Autowired
	private PlayBookDTO playBookDTO;

	// 고객센터 설명페이지
	@RequestMapping(value = "C_customerServiceForm", method = RequestMethod.GET)
	public ModelAndView C_customerServiceForm() {
		ModelAndView mav = new ModelAndView();

		mav.addObject("display", "/customerService/C_info.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	// 공지사항 페이지 오픈과 동시에 getNoticeList 불러온다.
	@RequestMapping(value = "C_notice", method = RequestMethod.GET)
	public ModelAndView C_notice(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		model.addAttribute("pg", Integer.parseInt(pg));
		ModelAndView mav = new ModelAndView();

		mav.addObject("display", "/customerService/C_notice.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	// 공지사항 리스트 데이터 베이스에서 불러와 notice.jsp로 리스트 보내주기
	@RequestMapping(value = "getNoticeList", method = RequestMethod.POST)
	public ModelAndView getNoticeList(@RequestParam(required = false, defaultValue = "1") String pg) {
		// DB - 1페이지당 10개씩
		int endNum = Integer.parseInt(pg) * 10;
		int startNum = endNum - 9;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		List<CustomerServiceDTO> list = customerServiceDAO.getNoticeList(map);

		int totalA = customerServiceDAO.getTotalC_notice();

		customerServicePaging.setCurrentPage(Integer.parseInt(pg));
		customerServicePaging.setPageBlock(10);
		customerServicePaging.setPageSize(10);
		customerServicePaging.setTotalA(totalA);
		customerServicePaging.C_notice_PagingHTML();
		ModelAndView mav = new ModelAndView();

		mav.addObject("list", list);
		mav.addObject("customerServicePaging", customerServicePaging);
		mav.setViewName("jsonView");
		return mav;
	}

	// 검색내용 찾아오기
	@RequestMapping(value = "C_notice_Search", method = RequestMethod.POST)
	public ModelAndView C_notice_Search(@RequestParam(required = false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 10;
		int startNum = endNum - 9;

		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");

		// DB
		List<CustomerServiceDTO> list = customerServiceDAO.C_notice_Search(map);

		// 페이징처리
		int totalA = customerServiceDAO.getTotalC_notice_Search(map);

		customerServicePaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		customerServicePaging.setPageBlock(10);
		customerServicePaging.setPageSize(10);
		customerServicePaging.setTotalA(totalA);
		customerServicePaging.C_notice_searchPagingHTML();

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("totalA", totalA);
		mav.addObject("customerServicePaging", customerServicePaging);
		mav.setViewName("jsonView");
		return mav;
	}

	// 공지사항 페이지에서 제목을 클리하면 내용을 보여준다.
	@RequestMapping(value = "C_notice_View", method = RequestMethod.GET)
	public ModelAndView C_notice_View(@RequestParam String seq, @RequestParam String pg, Model model) {
		CustomerServiceDTO customerServiceDTO = customerServiceDAO.getNoticeInfo(seq);

		model.addAttribute("customerServiceDTO", customerServiceDTO);
		model.addAttribute("pg", pg);

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/customerService/C_notice_View.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");

		return mav;
	}

	// 공지사항 내용을 확인후 수정버튼을 클릭하여 수정할수 있게 해준다.
	@RequestMapping(value = "C_notice_Modify", method = RequestMethod.GET)
	public ModelAndView C_notice_Modify(@RequestParam String seq, Model model) {
		CustomerServiceDTO customerServiceDTO = customerServiceDAO.getNoticeInfo(seq);

		model.addAttribute("customerServiceDTO", customerServiceDTO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/customerService/C_notice_Modify.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");

		return mav;
	}

	// 공지사항 수정한내용을 데이터 베이스에 저장하기
	@RequestMapping(value = "C_notice_checkModify", method = RequestMethod.POST)
	public ModelAndView C_notice_checkModify(@RequestParam String seq, @RequestParam String subject,
			@RequestParam String content) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq", seq);
		map.put("subject", subject);
		map.put("content", content);
		customerServiceDAO.C_notice_Modify(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/customerService/C_notice.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	// 공지사항에 기재되어 잇는 글을 데이터베이스 까지 삭제
	@RequestMapping(value = "C_notice_Delete", method = RequestMethod.GET)
	public ModelAndView C_notice_Delete(@RequestParam String seq) {
		customerServiceDAO.C_notice_Delete(seq);

		return new ModelAndView("redirect:/customerService/C_notice.do");
	}

	// 공지사항 - 작성하기
	@RequestMapping(value = "C_notice_WriteBtn", method = RequestMethod.GET)
	public ModelAndView C_notice_WriteBtn() {
		ModelAndView mav = new ModelAndView();

		mav.addObject("display", "/customerService/C_notice_Write.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	// 공지사항 - 작성하기 등록
	@RequestMapping(value = "C_notice_Write", method = RequestMethod.POST)
	public ModelAndView C_notice_Write(@RequestParam String subject, @RequestParam String content) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("subject", subject);
		map.put("content", content);
		// DB
		customerServiceDAO.C_notice_Write(map);

		return new ModelAndView("redirect:/customerService/C_notice.do");
	}

	// 고객의
	// 소리~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// 고객의소리(이메일 인증)
	@RequestMapping(value = "C_emailConfirm", method = RequestMethod.GET)
	public ModelAndView C_emailConfirm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/customerService/C_emailConfirm.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	// 고객의 소리 인증 번호 보내기
	@RequestMapping(value = "sendEmail", method = RequestMethod.POST)
	public @ResponseBody String sendEmail(@RequestParam final String email, Model model) {

		final String authNum = randomNum();

		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

				String subject = "[IPEC 전시회 이메일 인증 안내 입니다]";
				String content = "안녕하세요 IPEC 전시회 관계자 입니다.  해당 이메일 인증 번호는 아래와 같습니다.  인증번호 : " + authNum;
				helper.setFrom("jbi8045@gmail.com");
				helper.setTo(email);
				helper.setSubject("인증번호 메일입니다.");
				helper.setText(content, true);
			}
		};
		
		emailSender.send(preparator);
		return authNum;
	}

	// 이메일인증 인증번호 생성
	private String randomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	// 고객의소리 - 이메일 인증후 문의하기
	@RequestMapping(value = "C_inquire", method = RequestMethod.GET)
	public ModelAndView C_inquire(@RequestParam String email, Model model) {
		model.addAttribute("email", email);
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/customerService/C_inquire.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	// 고객의소리 문의 하기 등록
	@RequestMapping(value = "C_checkInquire", method = RequestMethod.POST)
	public ModelAndView C_checkInquire(@ModelAttribute CustomerServiceDTO customerServiceDTO) {
		customerServiceDAO.C_checkInquire(customerServiceDTO);
		return new ModelAndView("redirect:/customerService/C_emailConfirm.do");
	}

	// 고객의 소리 - 리스트폼(관리자)
	@RequestMapping(value = "C_inquire_List", method = RequestMethod.GET)
	public ModelAndView C_inquire_List(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		model.addAttribute("pg", Integer.parseInt(pg));
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/customerService/C_inquire_List.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	// 고객의소리 리스트불러오기(관리자)
	@RequestMapping(value = "getInquireList", method = RequestMethod.POST)
	public ModelAndView getInquireList(@RequestParam(required = false, defaultValue = "1") String pg) {
		// DB - 1페이지당 10개씩
		int endNum = Integer.parseInt(pg) * 10;
		int startNum = endNum - 9;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		List<CustomerServiceDTO> list = customerServiceDAO.getInquireList(map);

		int totalA = customerServiceDAO.getTotalC_inquire();

		customerServicePaging.setCurrentPage(Integer.parseInt(pg));
		customerServicePaging.setPageBlock(10);
		customerServicePaging.setPageSize(10);
		customerServicePaging.setTotalA(totalA);
		customerServicePaging.C_inquire_PagingHTML();

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("customerServicePaging", customerServicePaging);
		mav.setViewName("jsonView");
		return mav;
	}

	// 고객의 소리 문의받은글 검색 & 페이징
	@RequestMapping(value = "C_inquire_Search", method = RequestMethod.POST)
	public ModelAndView C_inquire_Search(@RequestParam(required = false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 10;
		int startNum = endNum - 9;

		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");

		// DB
		List<CustomerServiceDTO> list = customerServiceDAO.C_inquire_Search(map);

		// 페이징처리
		int totalA = customerServiceDAO.getTotalC_inquire_Search(map);

		customerServicePaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		customerServicePaging.setPageBlock(10);
		customerServicePaging.setPageSize(10);
		customerServicePaging.setTotalA(totalA);
		customerServicePaging.C_inquire_searchPagingHTML();

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("totalA", totalA);
		mav.addObject("customerServicePaging", customerServicePaging);
		mav.setViewName("jsonView");
		return mav;
	}

	// 고객의소리 내용보기(관리자
	@RequestMapping(value = "C_inquire_View", method = RequestMethod.GET)
	public ModelAndView C_inquire_View(@RequestParam int seq, @RequestParam String pg, Model model) {

		CustomerServiceDTO customerServiceDTO = customerServiceDAO.getInquireInfo(seq);

		model.addAttribute("customerServiceDTO", customerServiceDTO);
		model.addAttribute("pg", pg);

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/customerService/C_inquire_View.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	// 고객의 소리 - 문의 답하기 폼
	@RequestMapping(value = "C_inquire_Reply", method = RequestMethod.POST)
	public ModelAndView C_inquire_Reply(@ModelAttribute CustomerServiceDTO customerServiceDTO, @RequestParam String seq, @RequestParam String email, @RequestParam int pseq, @RequestParam int pg, Model model) {

		model.addAttribute("customerServiceDTO", customerServiceDTO);

		ModelAndView mav = new ModelAndView();
		model.addAttribute("pseq", pseq);
		model.addAttribute("pg", pg);
		mav.addObject("display", "/customerService/C_inquire_Reply.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	// 고객의 소리 답변(관리자)
	@RequestMapping(value = "C_inquire_checkReply", method = RequestMethod.POST)
	public @ResponseBody ModelAndView C_inquire_checkReply(@ModelAttribute CustomerServiceDTO customerServiceDTO, @RequestParam final String email,
										@RequestParam final String subject, @RequestParam final String content, @RequestParam int pg, Model model) {
		
		CustomerServiceDTO cDTO = customerServiceDAO.getInquireInfo(customerServiceDTO.getPseq());//원글
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

				String replySubject = subject;
				String replyContent = content;

				helper.setFrom("jbi8045@gmail.com");
				helper.setTo(email);
				helper.setSubject(replySubject);
				helper.setText(replyContent, true);
			}
		};
		customerServiceDTO.setRef(cDTO.getRef());//답글ref = 원글ref
		customerServiceDTO.setLev(cDTO.getLev()+1);//답글lev = 원글lev+1
		customerServiceDTO.setStep(cDTO.getStep()+1);//답글step = 원글step+1
		
		customerServiceDAO.C_inquire_Reply(customerServiceDTO);
		model.addAttribute("pg", pg);
		
		emailSender.send(preparator);
		return new ModelAndView("redirect:/customerService/C_inquire_List.do");
	}

	// 자주묻는
	// 질문~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// 자주묻는 질문
	@RequestMapping(value = "C_QnA", method = RequestMethod.GET)
	public ModelAndView C_QnAForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/customerService/C_QnA.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	// 자주묻는 질문 - 버튼에 따라 리스트 가져오기
	@RequestMapping(value = "getQnA_Classify", method = RequestMethod.POST)
	public ModelAndView getQnA_Classify(@RequestParam String classify) {
		List<CustomerServiceDTO> list = customerServiceDAO.getQnA_Classify(classify);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	// 자주묻는 질문 - 작성
	@RequestMapping(value = "C_QnA_Write", method = RequestMethod.GET)
	public ModelAndView C_QnA_Write() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/customerService/C_QnA_Write.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	// 자주묻는 질문 - 작성등록
	@RequestMapping(value = "C_QnA_checkWrite", method = RequestMethod.POST)
	public ModelAndView C_QnA_checkWrite(@RequestParam String C_qty, @RequestParam String subject,
			@RequestParam String content) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("classify", C_qty);
		map.put("subject", subject);
		map.put("content", content);
		// DB
		customerServiceDAO.C_QnA_checkWrite(map);

		return new ModelAndView("redirect:/customerService/C_QnA.do");
	}

	// 주요시설
	// 연락처~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// 주요시설 연락처
	@RequestMapping(value = "C_contactList", method = RequestMethod.GET)
	public ModelAndView C_contactList(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		model.addAttribute("pg", Integer.parseInt(pg));
		ModelAndView mav = new ModelAndView();

		mav.addObject("display", "/customerService/C_contactList.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	//주요시설 연락처 삭제
	@RequestMapping(value = "C_contactList_Delete", method = RequestMethod.POST)
	public ModelAndView C_contactList_Delete(@RequestParam String[] box, Model model) {

		List<Integer> list = new ArrayList<Integer>();

		customerServiceDAO.C_contactList_Delete(list);

		return new ModelAndView("redirect:/customerService/C_contactList.do");
	}

	// 주요시설 연락처 리스트 불러오기
	@RequestMapping(value = "getContactList", method = RequestMethod.POST)
	public ModelAndView getContactList(@RequestParam(required = false, defaultValue = "1") String pg) {
		// DB - 1페이지당 10개씩
		int endNum = Integer.parseInt(pg) * 10;
		int startNum = endNum - 9;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		List<CustomerServiceDTO> list = customerServiceDAO.getContactList(map);

		// 페이징처리
		int totalA = customerServiceDAO.getTotalC_contactList();

		customerServicePaging.setCurrentPage(Integer.parseInt(pg));
		customerServicePaging.setPageBlock(10);
		customerServicePaging.setPageSize(10);
		customerServicePaging.setTotalA(totalA);
		customerServicePaging.C_contactList_PagingHTML();

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("customerServicePaging", customerServicePaging);
		mav.setViewName("jsonView");
		return mav;
	}

	// 주요시설 연락처 - 작성
	@RequestMapping(value = "C_contactList_Write", method = RequestMethod.GET)
	public ModelAndView C_contactList_Write() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/customerService/C_contactList_Write.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");
		return mav;
	}

	// 주요시설 연락처 - 작성등록
	@RequestMapping(value = "C_contactList_checkWrite", method = RequestMethod.POST)
	public ModelAndView C_contactList_checkWrite(@RequestParam String classify, @RequestParam String facility,
			@RequestParam String title, @RequestParam String name, @RequestParam String phone) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("classify", classify);
		map.put("facility", facility);
		map.put("title", title);
		map.put("name", name);
		map.put("phone", phone);
		customerServiceDAO.C_contactList_checkWrite(map);

		return new ModelAndView("redirect:/customerService/C_contactList.do");
	}

	// 주요시설 연락처 검색
	@RequestMapping(value = "C_contactList_Search", method = RequestMethod.POST)
	public ModelAndView C_contactList_Search(@RequestParam(required = false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 10;
		int startNum = endNum - 9;

		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");

		// DB
		List<CustomerServiceDTO> list = customerServiceDAO.C_contactList_Search(map);

		// 페이징처리
		int totalA = customerServiceDAO.getTotalC_contactList_Search(map);

		customerServicePaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		customerServicePaging.setPageBlock(10);
		customerServicePaging.setPageSize(10);
		customerServicePaging.setTotalA(totalA);
		customerServicePaging.C_contactList_searchPagingHTML();

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("totalA", totalA);
		mav.addObject("customerServicePaging", customerServicePaging);
		mav.setViewName("jsonView");
		return mav;
	}

	// 이미지 boardWriteForm
	@RequestMapping(value = "C_mainImageboardForm", method = RequestMethod.GET)
	public ModelAndView imageboardWriteForm() {

		ModelAndView mav = new ModelAndView();

		mav.addObject("postSelect", "0");
		mav.setViewName("/customerService/C_mainImageboardForm");
		return mav;
	}

	// 이미지 boardWrite(ajax)
	@RequestMapping(value = "C_imageboardWrite", method = RequestMethod.POST)
	public String imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO, @RequestParam MultipartFile img,
			Model model) {
		// 경로 바꿔야함***
		String fileName = img.getOriginalFilename();

		File file = new File(filePath, fileName);

		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));

		} catch (IOException e) {
			e.printStackTrace();
		}

		imageboardDTO.setImage1(fileName);
		// DB
		customerServiceDAO.imageboardWrite(imageboardDTO);
		model.addAttribute("imageboardDTO", imageboardDTO);
		return "/customerService/C_mainImageboardListForm";
	}

	// 이미지보드 리스트
	@RequestMapping(value = "C_mainImageboardListForm", method = RequestMethod.GET)
	public String imageboardListForm(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {

		model.addAttribute("pg", pg);
		return "/customerService/C_mainImageboardListForm";
	}

	// 이미지보드 리스트(ajax)
	@RequestMapping(value = "getImageboardList", method = RequestMethod.POST)
	public ModelAndView getImageboardList(@RequestParam(required = false, defaultValue = "1") String pg) {

		int endNum = Integer.parseInt(pg) * 3;
		int startNum = endNum - 2;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);

		int totalA = customerServiceDAO.getImageboardTotalA();

		imageboardPaging.setCurrentPage(Integer.parseInt(pg));
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);

		imageboardPaging.makePagingHTML();

		List<ImageboardDTO> list = customerServiceDAO.imageboardList(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("imageboardPaging", imageboardPaging);

		mav.addObject("/customerService/C_imageboardList.jsp");
		mav.setViewName("jsonView");
		return mav;
	}

	// 이미지보드 삭제
	@RequestMapping(value = "C_imageboardDelete", method = RequestMethod.POST)
	public String imageboardDelete(@RequestParam String[] check, Model model) {

		List<Integer> list = new ArrayList<Integer>();
		for (String seq : check) {
			list.add(Integer.parseInt(seq));
		}

		customerServiceDAO.imageboardDelete(list);
		return "/customerService/C_mainImageboardListForm";
	}

	// 박람회 정보 넣는 컨트롤러
	@RequestMapping(value = "C_eventInfoWrite", method = RequestMethod.POST)
	public ModelAndView C_exhibitionInfoWrite(@ModelAttribute EventboardDTO eventboardDTO,
			@RequestParam MultipartFile img) {

		// 경로 바꿔야함***
		String fileName = img.getOriginalFilename();

		File file = new File(filePath, fileName);

		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));

		} catch (IOException e) {
			e.printStackTrace();
		}

		eventboardDTO.setImage1(fileName);

		// DB
		customerServiceDAO.eventInfoWrite(eventboardDTO);

		return new ModelAndView("redirect:/customerService/C_eventboardListForm.do");
	}

	// 연극 정보 넣는 컨
	@RequestMapping(value = "C_eventInfoWrite_play", method = RequestMethod.POST)
	public ModelAndView C_exhibitionInfoWrite_play(@ModelAttribute EventboardDTO eventboardDTO,
			@RequestParam MultipartFile img, HttpSession session) {

		// 경로 바꿔야함***
		String fileName = img.getOriginalFilename();

		File file = new File(filePath, fileName);

		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));

		} catch (IOException e) {
			e.printStackTrace();
		}

		eventboardDTO.setImage1(fileName);

		// 세션에서 아이디 얻기
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("homepageMember");
		String id = memberDTO.getM_Id();

		// String 타입 날짜를 Date 형식으로 변환(연극 기간 구하기)
		eventboardDTO.setStartDate(eventboardDTO.getStartDate().substring(0, 10).replaceAll("/", "-"));
		eventboardDTO.setEndDate(eventboardDTO.getEndDate().substring(0, 10).replaceAll("/", "-"));

		System.out.println(eventboardDTO.getStartDate());
		System.out.println(eventboardDTO.getEndDate());
		System.out.println(eventboardDTO.getImageName());

		String startDate = eventboardDTO.getStartDate();
		String endDate = eventboardDTO.getEndDate();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		long diff = 0;
		long diffDays = 0;
		Date startDateF = null;

		try {
			startDateF = formatter.parse(startDate);
			Date endDateF = formatter.parse(endDate);

			diff = endDateF.getTime() - startDateF.getTime();
			diffDays = diff / (24 * 60 * 60 * 1000); // 종료일-시작일 = 행사 일 수(기간)

		} catch (ParseException e) {
			e.printStackTrace();
		}

		Calendar calStart = Calendar.getInstance();
		calStart.setTime(startDateF);

		// 공연 기간 리스트 구하기
		List<Date> listDate = new ArrayList<Date>();
		for (int i = 0; i <= diffDays; i++) {

			listDate.add(calStart.getTime());
			calStart.add(Calendar.DATE, 1);
		}

		List<PlayBookDTO> list = new ArrayList<PlayBookDTO>();

		// 예매DB
		for (int i = 0; i <= diffDays; i++) {
			playBookDTO.setImageName(eventboardDTO.getImageName()); // 공연명 등록
			playBookDTO.setPlayTicket(Integer.parseInt(eventboardDTO.getEventSeats())); // 일별 총 티켓 수 등록
			playBookDTO.setRemainTicket(0); // 일별 잔여 티켓 수 등록
			playBookDTO.setTicketPrice(Integer.parseInt(eventboardDTO.getEventPrice())); // 티켓 가격
			playBookDTO.setBookTicket(0); // 예매된 티켓 수
			playBookDTO.setBookMemberId(id + ""); // 예매자 아이디(세션값에서)
			playBookDTO.setBookStatus('0'); // 예매 구분자 (0:예매X, 1:예매완료)

			playBookDTO.setPlayDate(listDate.get(i));

			list.add(playBookDTO);

			System.out.println(playBookDTO.getImageName());

			customerServiceDAO.eventInfoWrite_play_bookDB(playBookDTO); // 예매 DB에 연극 정보 넣는 메소드(예매DB)
		}
		customerServiceDAO.eventInfoWrite_play(eventboardDTO);

		return new ModelAndView("redirect:/customerService/C_eventboardList_playForm.do");
	}

	// 이미지 슬라이드 가져오는 컨트롤러
	@RequestMapping(value = "getImageboardSlide", method = RequestMethod.GET)
	public ModelAndView getImageboardSlide(@RequestParam String code) {
		ArrayList<ImageboardDTO> list = new ArrayList<ImageboardDTO>();
		ModelAndView mav = new ModelAndView();
		String[] str = { "posterMain.jpg", "poster2.jpg", "poster4.jpg", "poster1.jpg", "poster3.jpg" };

		if (code.equals("1")) {
			for (int i = 0; i < str.length; i++) {
				ImageboardDTO imageboardDTO = new ImageboardDTO();
				imageboardDTO.setImage1(str[i]);
				System.out.println(imageboardDTO.getImage1());
				list.add(imageboardDTO);
			}
			mav.addObject("list", list);
			mav.setViewName("jsonView");
		}
		/*
		 * }else if(code.equals("null")) { List<ImageboardDTO> list1 =
		 * customerServiceDAO.getImageboardSlide();
		 * 
		 * mav.addObject("list", list1); mav.setViewName("jsonView");
		 * 
		 * }
		 */

		return mav;
	}

	@RequestMapping(value = "getImageboardSlide1", method = RequestMethod.POST)
	public ModelAndView getImageboardSlide1(@RequestParam List<String> list) {
		ModelAndView mav = new ModelAndView();
		for (String data : list) {
			System.out.println("data=" + data);
		}
		List<ImageboardDTO> list1 = customerServiceDAO.getImageboardSlide(list);

		mav.addObject("list", list1);
		mav.setViewName("jsonView");

		return mav;
	}

	// 박람회 업로드 리스트 폼
	@RequestMapping(value = "C_eventboardListForm", method = RequestMethod.GET)
	public ModelAndView C_exhibitionboardList(@RequestParam(required = false, defaultValue = "1") String pg) {

		int endNum = Integer.parseInt(pg) * 3;
		int startNum = endNum - 2;

		Map<String, Integer> map = new HashMap<String, Integer>();
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

		for (EventboardDTO dto : list) {
			System.out.println(dto.getImageName());
		}

		mav.addObject("pg", pg);
		mav.addObject("imageboardPaging", imageboardPaging);
		mav.addObject("listSize", list.size() + "");
		mav.addObject("list", list);
		mav.setViewName("/customerService/C_eventboardListForm");
		return mav;
	}

	// 박람회 정보 보기(이미지 클릭 시, -> 수정하기 위해서)***잠시 대기중************************
	@RequestMapping(value = "C_eventDetail", method = RequestMethod.GET)
	public ModelAndView C_eventDetail(@RequestParam String seq) {

		// DB
		EventboardDTO eventboardDTO = customerServiceDAO.getEventboard(seq);

		ModelAndView mav = new ModelAndView();
		mav.addObject("eventboardDTO", eventboardDTO);
		mav.addObject("postSelect", "1");
		mav.addObject("modify", "1");
		mav.setViewName("/customerService/C_mainImageboardForm");

		return mav;
	}

	// 박람회 업로드 리스트 삭제
	@RequestMapping(value = "C_eventboardDelete", method = RequestMethod.POST)
	public ModelAndView C_eventboardDelete(@RequestParam String[] check) {

		List<Integer> list = new ArrayList<Integer>();
		for (String seq : check) {
			list.add(Integer.parseInt(seq));
		}

		// DB
		customerServiceDAO.eventboardDelete(list);

		return new ModelAndView("redirect:/customerService/C_eventboardListForm.do");
	}

	// 연극 업로드 리스트 폼
	@RequestMapping(value = "C_eventboardList_playForm", method = RequestMethod.GET)
	public ModelAndView C_eventboardList_playForm(@RequestParam(required = false, defaultValue = "1") String pg) {

		int endNum = Integer.parseInt(pg) * 3;
		int startNum = endNum - 2;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);

		int totalA = customerServiceDAO.getEventboardTotalA_play();

		imageboardPaging.setCurrentPage(Integer.parseInt(pg));
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);

		imageboardPaging.eventMakePagingHTML();

		// DB
		List<EventboardDTO> list = customerServiceDAO.eventboardList_play(map);

		ModelAndView mav = new ModelAndView();

		mav.addObject("pg", pg);
		mav.addObject("imageboardPaging", imageboardPaging);
		mav.addObject("listSize", list.size() + "");
		mav.addObject("list", list);
		mav.setViewName("/customerService/C_eventboardList_playForm");
		return mav;
	}

	// 연극 업로드 리스트 삭제
	@RequestMapping(value = "C_eventboardDelete_play", method = RequestMethod.POST)
	public ModelAndView C_eventboardDelete_play(@RequestParam String[] check) {

		List<Integer> list = new ArrayList<Integer>();
		for (String seq : check) {
			list.add(Integer.parseInt(seq));
		}

		// DB
		customerServiceDAO.eventboardDelete_play(list);

		return new ModelAndView("redirect:/customerService/C_eventboardList_playForm.do");
	}

	// 호텔 이미지 넣기
	@RequestMapping(value = "C_hotelInfoWrite", method = RequestMethod.POST)
	public ModelAndView C_hotelInfoWrite(@ModelAttribute HotelboardDTO hotelboardDTO, @RequestParam MultipartFile img) {

		// 경로 바꿔야함***
		String fileName = img.getOriginalFilename();

		File file = new File(filePath, fileName);

		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));

		} catch (IOException e) {
			e.printStackTrace();
		}
		hotelboardDTO.setImage1(fileName);

		// DB
		customerServiceDAO.hotelInfoWrite(hotelboardDTO);
		return new ModelAndView("redirect:/customerService/C_hotelListForm.do");
	}

	// 호텔 리스트
	@RequestMapping(value = "C_hotelListForm", method = RequestMethod.GET)
	public ModelAndView C_hotelListForm(@RequestParam(required = false, defaultValue = "1") String pg) {
		int endNum = Integer.parseInt(pg) * 8;
		int startNum = endNum - 7;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);

		int totalA = customerServiceDAO.getHotelboardTotalA();

		imageboardPaging.setCurrentPage(Integer.parseInt(pg));
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(8);
		imageboardPaging.setTotalA(totalA);

		imageboardPaging.hotelMakePagingHTML();

		List<HotelboardDTO> list = customerServiceDAO.hotelList(map);
		ModelAndView mav = new ModelAndView();

		mav.addObject("pg", pg);
		mav.addObject("imageboardPaging", imageboardPaging);
		mav.addObject("listSize", list.size() + "");
		mav.addObject("list", list);
		mav.setViewName("/customerService/C_hotelListForm");
		return mav;
	}

	// 호텔 업로드 리스트 삭제
	@RequestMapping(value = "C_hotelDelete", method = RequestMethod.POST)
	public ModelAndView C_hotelDelete(@RequestParam String[] check) {

		List<Integer> list = new ArrayList<Integer>();
		for (String seq : check) {
			list.add(Integer.parseInt(seq));
			System.out.println(seq);
		}

		// DB
		List<HotelboardDTO> list2 = customerServiceDAO.hotelImageDel(list); // 이미지 삭제
		for (HotelboardDTO hotelboardDTO : list2) {
			File file = new File(filePath + hotelboardDTO.getImage1());
			if (file.exists())
				file.delete();
		}

		customerServiceDAO.hotelDelete(list); // db삭제
		return new ModelAndView("redirect:/customerService/C_hotelListForm.do");
	}

	// 호텔리스트 수정을 클리하면 내용을 보여준다.
	@RequestMapping(value = "C_hotel_modify", method = RequestMethod.GET)
	public String C_hotel_modify(@RequestParam String seq, Model model) {
		HotelboardDTO hotelboardDTO = customerServiceDAO.getHotelInfo(seq);
		model.addAttribute("hotelboardDTO", hotelboardDTO);
		return "/customerService/C_hotel_modify";
	}

	// 호텔 수정완료 클릭시 DB내용 수정
	@RequestMapping(value = "C_hotelboardMod", method = RequestMethod.POST)
	public ModelAndView C_hotelboardMod(@ModelAttribute HotelboardDTO hotelboardDTO, @RequestParam MultipartFile img) {
		if (!img.isEmpty()) {
			File fileDelete = new File(filePath + hotelboardDTO.getImage1());
			if (fileDelete.exists())
				fileDelete.delete();
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			hotelboardDTO.setImage1(fileName);
		}
		customerServiceDAO.C_hotelboardMod(hotelboardDTO);

		return new ModelAndView("redirect:/customerService/C_hotelListForm.do");
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

	// 부스별 총 매출액 보여주는 페이지로 이동
	@RequestMapping(value = "C_salesExhibitionView", method = RequestMethod.GET)
	public ModelAndView R_salesExhibitionView() {
		ModelAndView mav = new ModelAndView();

		mav.addObject("display", "/customerService/C_salesExhibitionView.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");

		return mav;
	}

	// 부스별 총 매출액 보여주는 컨트롤
	@RequestMapping(value = "C_salesExhibition", method = RequestMethod.POST)
	public ModelAndView R_salesExhibition(@RequestParam String year, @RequestParam String month) {
		String salesMon = year.substring(2) + "-" + month + "-" + "01";

		// 부스명, 예약점유 일수, 총 매출액 가져오는 sql
		List<SalesExhigitionDTO> list = customerServiceDAO.getSalesExhibition(salesMon);

		int salesTotalRent = customerServiceDAO.getSalesTotalRentExhibition(salesMon);
		String salesTotalRentstr = String.format("%,d", salesTotalRent);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("salesTotalRent", salesTotalRentstr);
		mav.setViewName("jsonView");
		return mav;
	}

	// 회원리스트로 이동
	@RequestMapping(value = "C_memberShib", method = RequestMethod.GET)
	public ModelAndView C_memberShib() {
		ModelAndView mav = new ModelAndView();

		mav.addObject("display", "/customerService/C_memberShib.jsp");
		mav.setViewName("/customerService/C_customerServiceForm");

		return mav;
	}

	// 회원리스트 불러오기
	@RequestMapping(value = "getMemberList", method = RequestMethod.GET)
	public ModelAndView getMemberList() {
	
		List<MemberDTO> list = customerServiceDAO.getMemberList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");

		return mav;
	}

}
