package main.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Component
public class IndexController {
	
	//메인화면 불러오기
	@RequestMapping(value="/main/index.do", method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.addObject("display", "/main/I_body.jsp");
		
		mav.setViewName("/main/index");
		return mav;
	}
}
