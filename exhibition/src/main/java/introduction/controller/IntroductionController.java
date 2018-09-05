package introduction.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="introduction")
@Component
public class IntroductionController {
	//소개하는 정보
	@RequestMapping(value="I_infoForm", method=RequestMethod.GET)
	public String I_infoForm() {
		return "/introduction/I_infoForm";
	}
	//회사정보
	@RequestMapping(value="I_companyIntroductionForm", method=RequestMethod.GET)
	public String I_companyIntroduction() {
		return "/introduction/I_companyIntroductionForm";
	}
	//CEO인사말
	@RequestMapping(value="I_CEOIntroductionForm", method=RequestMethod.GET)
	public String I_CEOIntroduction() {
		return "/introduction/I_CEOIntroductionForm";
	}
}
