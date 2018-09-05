package performance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import performance.bean.PerformanceDTO;
import performance.dao.PerformanceDAO;

@RequestMapping(value="performance")
@Component
public class PerformanceController {
	@Autowired
	private PerformanceDAO performanceDAO;
	
	@RequestMapping(value="P_performanceForm", method=RequestMethod.GET)
	public String P_performanceForm() {
		return "/performance/performanceForm";
	}
	@RequestMapping(value="getPerformance", method=RequestMethod.GET)
	public ModelAndView getPerformance() {
		ModelAndView mav = new ModelAndView();
		List<PerformanceDTO> list = performanceDAO.getPerformance();
		
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
	}
	//일정정보
	@RequestMapping(value="P_infoForm", method=RequestMethod.GET)
	public String P_infoForm() {
		return "/performance/P_infoForm";
	}
	//전체일정
	@RequestMapping(value="P_allScheduleForm", method=RequestMethod.GET)
	public String P_allSchedule() {
		return "/performance/P_allScheduleForm";
	}
	//공연일정
	@RequestMapping(value="P_performanceScheduleForm", method=RequestMethod.GET)
	public String P_showSchedule() {
		return "/performance/P_performanceScheduleForm";
	}
	//전시회일정
	@RequestMapping(value="P_exhibitionScheduleForm", method=RequestMethod.GET)
	public String P_exhibitionSchedule() {
		return "/performance/P_exhibitionScheduleForm";
	}
	
}
