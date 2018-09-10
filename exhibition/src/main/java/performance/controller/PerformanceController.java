package performance.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;

import java.util.List;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import performance.bean.PerformanceDTO;
import performance.dao.PerformanceDAO;
import rental.bean.ExhibitionDTO;

@RequestMapping(value="performance")
@Component
public class PerformanceController {
/*	전역변수 설정*/
	@Autowired
	private PerformanceDAO performanceDAO;
	
	
/* 사용메서드*/
	/*일정정보에 관한 내용이 들어 있는 페이지로 이동~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	@RequestMapping(value="P_performanceForm", method=RequestMethod.GET)
	public ModelAndView P_performanceForm1() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dispaly","/performance/P_info.jsp");
		mav.setViewName("/performance/P_performanceForm");
		
	return mav;
	}
	//전체일정
	@RequestMapping(value="P_allSchedule", method=RequestMethod.GET)
	public ModelAndView P_allSchedule(ModelMap modelMap) {

			List<PerformanceDTO> list = performanceDAO.getPerformance();
				 
			for(PerformanceDTO data : list) {
				data.setSize(list.size());
				data.setStartDate(data.getStartDate().substring(0, 10));
				data.setEndDate(data.getEndDate().substring(0, 10));
				data.setDays(getDiffDays(data.getStartDate().substring(0, 10).replaceAll("-", "").replaceAll("/",""), data.getEndDate().substring(0, 10).replaceAll("-", "").replaceAll("/","")));
				String[] strDays = data.getDays();
				
				for(int i = 0; i < data.getDays().length; i++) {
					StringBuffer sb = new StringBuffer(strDays[i]);
					sb.insert(4, "-");
					sb.insert(7, "-");
					strDays[i] = sb.toString();
				}
				
				data.setDays(strDays);
				data.setDaysSize(strDays.length);
				
			}
			modelMap.addAttribute("listView",list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/performance/P_allCalendar.jsp");
		mav.setViewName("/performance/P_performanceForm");
	
	return mav;
	}

	
	@RequestMapping(value="getPerformance", method=RequestMethod.GET)
	public String getPerformance(ModelMap modelMap) {
		List<PerformanceDTO> list = performanceDAO.getPerformance();
		
		for(PerformanceDTO data : list) {
			data.setStartDate(data.getStartDate().substring(0, 10));
			data.setEndDate(data.getEndDate().substring(0, 10));
			data.setDays(getDiffDays(data.getStartDate().substring(0, 10).replaceAll("-", ""), data.getEndDate().substring(0, 10).replaceAll("-", "")));
			String[] strDays = data.getDays();
			for(int i = 0; i < data.getDays().length; i++) {
				StringBuffer sb = new StringBuffer(strDays[i]);
				sb.insert(4, "-");
				sb.insert(7, "-");
				strDays[i] = sb.toString();
			}
			data.setDays(strDays);
			data.setDaysSize(strDays.length);
		}
		
		modelMap.addAttribute("listView",list);
		return "/performance/getPerformance";
	}
	
	
	//공연일정
	@RequestMapping(value="P_performanceScheduleForm", method=RequestMethod.GET)
	public String P_performanceScheduleForm(ModelMap modelMap) {
		List<PerformanceDTO> list = performanceDAO.getPerformance();
		
		for(PerformanceDTO data : list) {
			data.setSize(list.size());
			data.setStartDate(data.getStartDate().substring(0, 10));
			data.setEndDate(data.getEndDate().substring(0, 10));
			data.setDays(getDiffDays(data.getStartDate().substring(0, 10).replaceAll("-", ""), data.getEndDate().substring(0, 10).replaceAll("-", "")));
			String[] strDays = data.getDays();
			for(int i = 0; i < data.getDays().length; i++) {
				StringBuffer sb = new StringBuffer(strDays[i]);
				sb.insert(4, "-");
				sb.insert(7, "-");
				strDays[i] = sb.toString();
				
			}
			data.setDays(strDays);
			data.setDaysSize(strDays.length);
		}
		
		modelMap.addAttribute("listView",list);
	
		return "/performance/P_performanceScheduleForm";
	}
	
	
	
	//전시회일정
	@RequestMapping(value="P_exhibitionScheduleForm", method=RequestMethod.GET)
	public String P_exhibitionScheduleForm(ModelMap modelMap) {
		List<PerformanceDTO> list = performanceDAO.getPerformance();
		
		for(PerformanceDTO data : list) {
			data.setStartDate(data.getStartDate().substring(0, 10));
			data.setEndDate(data.getEndDate().substring(0, 10));
			data.setDays(getDiffDays(data.getStartDate().substring(0, 10).replaceAll("-", ""), data.getEndDate().substring(0, 10).replaceAll("-", "")));
			String[] strDays = data.getDays();
			for(int i = 0; i < data.getDays().length; i++) {
				StringBuffer sb = new StringBuffer(strDays[i]);
				sb.insert(4, "-");
				sb.insert(7, "-");
				strDays[i] = sb.toString();
				
			}
			data.setDays(strDays);
			data.setDaysSize(strDays.length);
		}
		modelMap.addAttribute("listView",list);
		
		return "/performance/P_exhibitionScheduleForm";
	}
	
	
	
	
	
	//달력 메소드
	public static String[] getDiffDays(String fromDate, String toDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		Calendar cal = Calendar.getInstance();

		try {
		cal.setTime(sdf.parse(fromDate));
		} catch (Exception e) {
		}

		int count = getDiffDayCount(fromDate, toDate);

		// 시작일부터
		cal.add(Calendar.DATE, -1);

		// 데이터 저장
		ArrayList<String> list = new ArrayList<String>();

		for (int i = 0; i <= count; i++) {
		cal.add(Calendar.DATE, 1);

		list.add(sdf.format(cal.getTime()));
		}

		String[] result = new String[list.size()];

		list.toArray(result);

		return result;
	}
	
	/**
	* 두날짜 사이의 일수를 리턴
	* 
	* @param fromDate
	* yyyyMMdd 형식의 시작일
	* @param toDate
	* yyyyMMdd 형식의 종료일
	* @return 두날짜 사이의 일수
	*/
	public static int getDiffDayCount(String fromDate, String toDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		try {
		return (int) ((sdf.parse(toDate).getTime() - sdf.parse(fromDate)
		.getTime()) / 1000 / 60 / 60 / 24);
		} catch (Exception e) {
		return 0;
		}
	}
	
}
