package company.controller;

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

import company.bean.CompanyDTO;
import company.dao.CompanyDAO;

@RequestMapping(value="company")
@Component
public class CompanyController {
	@Autowired
	private CompanyDAO companyDAO;
	
	//사업자 회원가입
	@RequestMapping(value="companyWrite",method=RequestMethod.POST)
	public ModelAndView write(@ModelAttribute CompanyDTO companyDTO, HttpSession session) {
		companyDAO.write(companyDTO);
		//회원가입 축하 메세지
		session.setAttribute("registerMessage", companyDTO.getC_businessname() +"님 회원가입을 축하합니다");
		session.setMaxInactiveInterval(60);//1분 간 메세지 유효
		
		return new ModelAndView("redirect:/main/index.do");
	}
	
	//중복체크
	//아이디 중복 검사
	@RequestMapping(value="checkNum", method=RequestMethod.POST)
	public @ResponseBody String checkId(@RequestParam String sNum) {
		//DB
		CompanyDTO companyDTO = companyDAO.checkId(sNum);
		if(companyDTO==null) return "not_exist";
		else return "exist";
	}
	//비밀번호찾기-이메일 체크
	@RequestMapping(value="checkEmail", method=RequestMethod.POST)
	public @ResponseBody String checkEmail(@RequestParam String email, @RequestParam String sNum) {
		//데이터 싣기
		Map<String,String> map = new HashMap<String, String>();
		map.put("C_email", email);
		map.put("C_license", sNum);
		
		//DB
		CompanyDTO companyDTO = companyDAO.checkEmail(map);
		if(companyDTO==null) return "not_exist";
		else return "exist";
	}
	
	//사업자 정보수정
	@RequestMapping(value="modifyCompany", method=RequestMethod.POST)
	public @ResponseBody String modifyCompany(@RequestParam String C_license, @RequestParam String C_password,
											  @RequestParam String C_condition,@RequestParam String C_postnumbox,
											  @RequestParam String C_address1,@RequestParam String C_address2,
											  @RequestParam String C_tel,@RequestParam String C_email,HttpSession session) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("C_license", C_license);
		map.put("C_password", C_password);
		map.put("C_condition", C_condition);
		map.put("C_postnumbox", C_postnumbox);
		map.put("C_address1", C_address1);
		map.put("C_address2", C_address2);
		map.put("C_tel", C_tel);
		map.put("C_email", C_email);
		
		//DB
		companyDAO.modifyCompany(map);
		session.invalidate();

		return "modify";
	}
	
	//사업자 삭제
	@RequestMapping(value="deleteCompany", method=RequestMethod.POST)
	public @ResponseBody String deleteCompany(@RequestParam String C_license,@RequestParam String C_password,HttpSession session) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("C_license", C_license);
		map.put("C_password", C_password);
		
		//DB
		int su = companyDAO.deleteCompany(map);
		if(su==0) return "not_exist";
		else {
			session.invalidate();
			return "exist";
		}
	}
	
	//탈퇴완료 페이지
	@RequestMapping(value="outComplete", method=RequestMethod.GET)
	public ModelAndView outComplete() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login/outComplete");	//탈퇴완료 페이지
		return mav;
	}
	
	
}
