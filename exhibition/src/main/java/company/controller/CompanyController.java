package company.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
}
