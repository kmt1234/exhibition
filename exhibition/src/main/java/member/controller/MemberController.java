package member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value="member")
public class MemberController {
	
	@Autowired
	private MemberDAO memberDAO;
	
	//회원가입
	@RequestMapping(value="memberWrite",method=RequestMethod.POST)
	public ModelAndView MemberWrite(@ModelAttribute MemberDTO memberDTO, HttpSession session) {	
		//DB
		memberDAO.memberWrite(memberDTO);
		//회원가입 축하 메세지
		session.setAttribute("registerMessage", memberDTO.getM_Id()+"님 회원가입을 축하합니다");
		session.setMaxInactiveInterval(60);//1분 간 메세지 유효
		
		return new ModelAndView("redirect:/main/index.do");
	}
	
	//아이디 중복 검사
	@RequestMapping(value="checkId", method=RequestMethod.POST)
	public @ResponseBody String checkId(@RequestParam String M_Id) {
				
		//DB
		MemberDTO memberDTO = memberDAO.checkId(M_Id);
		
		if(memberDTO==null) return "not_exist";
		else return "exist";
	}
	
	//이메일 중복 검사
	@RequestMapping(value="checkEmail", method=RequestMethod.POST)
	public @ResponseBody String checkEmail(@RequestParam String M_Email) {
		
		//DB
		MemberDTO memberDTO = memberDAO.checkEmail(M_Email);
		
		if(memberDTO==null) return "not_exist";
		else return "exist";
	}
	
	//개인회원 아이디 찾기
	@RequestMapping(value="findMemberId", method=RequestMethod.POST)
	public @ResponseBody String findMemberId(@RequestParam String M_Name,
											 @RequestParam String M_Phone,
											 @RequestParam String M_Email) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("M_Name", M_Name);
		map.put("M_Phone", M_Phone);
		map.put("M_Email", M_Email);
		
		//DB
		MemberDTO memberDTO = memberDAO.findMemberId(map);
		
		if(memberDTO == null) return "not_exist";
		else {
			return memberDTO.getM_Id();
		}  
	}
	
	//마이페이지
	@RequestMapping(value="memberMypage", method=RequestMethod.GET)
	public ModelAndView memberMypage() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberMypage");
		
		return mav;
	}
	
	//회원정보 수정
	@RequestMapping(value="memberModify", method=RequestMethod.POST)
	public @ResponseBody String memberModify(@RequestParam String M_Id
											,@RequestParam String M_Pwd
											,@RequestParam String M_Phone
											,@RequestParam String M_Email
											,HttpSession session) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("M_Id", M_Id);
		map.put("M_Pwd", M_Pwd);
		map.put("M_Phone", M_Phone);
		map.put("M_Email", M_Email);
		
		//DB
		int result = memberDAO.memberModify(map);
	
		if(result==1) {
			session.invalidate();
			return "modify";
		}else {
			return "fail";
		}
		
		
	}
	
	
	//개인회원 삭제
	@RequestMapping(value="deleteMember", method=RequestMethod.POST)
	public @ResponseBody String deleteMember(@RequestParam String M_Id,@RequestParam String M_Pwd,HttpSession session) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("M_Id", M_Id);
		map.put("M_Pwd", M_Pwd);
		
		//DB
		int su=0;
		int checkBookExhibition = memberDAO.checkBookExhibition(map);
		int checkBookPlay = memberDAO.checkBookPlay(map);
		int checkBookBusiness = memberDAO.checkBookBusiness(map);
		
		if(checkBookExhibition>0 || checkBookPlay>0 || checkBookBusiness>0) {
			return "exist_book";
		} 
		else if(checkBookExhibition==0 && checkBookPlay==0 && checkBookBusiness==0){
			su = memberDAO.deleteMember(map);
			session.invalidate();
			return "exist";
		}else if(su==0) {
			return "not_exist";
		}else {
			return "tell_manager";
		}
	}
	
	//탈퇴완료 페이지
	@RequestMapping(value="outComplete", method=RequestMethod.GET)
	public ModelAndView outComplete() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login/outComplete");	//탈퇴완료 페이지
		return mav;
	}
	
	//개인회원 인증번호 발송 시, 회원의 아이디 및 이메일 일치 여부 확인
	@RequestMapping(value="verifyNumEmailCheck", method=RequestMethod.POST)
	public @ResponseBody String verifyNumEmailCheck(@RequestParam String M_Id, @RequestParam String M_Email) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("M_Id", M_Id);
		map.put("M_Email", M_Email);
		
		//DB
		MemberDTO memberDTO = memberDAO.verifyNumEmailCheck(map);
		
		if(memberDTO==null) return "not_exist";
		else return "exist";
	}
	
	
	@RequestMapping(value="costomerServiceForm",method=RequestMethod.GET)
	public String costomerService() {
		return "/member/costomerServiceForm";
	}
	
	@RequestMapping(value="rentalForm",method=RequestMethod.GET)
	public String rental() {
		return "/member/rentalForm";
	}
	
	@RequestMapping(value="introductionForm",method=RequestMethod.GET)
	public String introduction() {
		return "/member/introductionForm";
	}
	
	@RequestMapping(value="performanceForm",method=RequestMethod.GET)
	public String performance() {
		return "/member/performanceForm";
	}
	
	@RequestMapping(value="trafficForm",method=RequestMethod.GET)
	public String traffic() {
		return "/member/trafficForm";
	}
	
}
