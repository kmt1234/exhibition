package performance.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import customerService.bean.EventboardDTO;
import performance.bean.PerformancePaging;
import performance.dao.PerformanceDAO;
import rental.dao.ExhibitionDAO;


@RequestMapping(value="performance")
@Component
public class PerformanceController {
/*	전역변수 설정*/
	@Autowired
	private PerformanceDAO performanceDAO;
	@Autowired
	private PerformancePaging performancePaging;
	@Autowired
	private ExhibitionDAO exhibitionDAO;
	
/* 사용메서드*/
	/*일정정보에 관한 내용이 들어 있는 페이지로 이동~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
	@RequestMapping(value="P_performanceForm", method=RequestMethod.GET)
	public ModelAndView P_performanceForm1() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display","/performance/P_info.jsp");
		mav.setViewName("/performance/P_performanceForm");
		
		return mav;
	}
	/*전체일정 공연&박람회 데이터 베이스에서 데이터 갑을 받아와야 한다.
	현제 임시 데이터 베이스 사용중*/
	@RequestMapping(value="P_allSchedule", method=RequestMethod.GET)
	public ModelAndView P_allSchedule(ModelMap modelMap) {

			List<EventboardDTO> list = performanceDAO.getPerformance();
			list.addAll(performanceDAO.getPerformancePlay());
			
			for(EventboardDTO data : list) {
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
		mav.addObject("display","/performance/P_allCalendar.jsp");
		mav.setViewName("/performance/P_performanceForm");
		return mav ;
	}
	
	
	/*@RequestMapping(value="getPerformance", method=RequestMethod.GET)
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
	}*/
	
	
	//공연일정를 데이터베이스에서 불러와 달력으로 보내준다.
	@RequestMapping(value="P_performanceSchedule", method=RequestMethod.GET)
	public ModelAndView P_performanceSchedule(ModelMap modelMap) {
		List<EventboardDTO> list = performanceDAO.getPerformancePlay();
		
		for(EventboardDTO data : list) {
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
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/performance/P_performanceCalendar.jsp");
		mav.setViewName("/performance/P_performanceForm");
		return mav ;
	}
	
	//공연일정 리스트
	@RequestMapping(value="P_performanceList", method=RequestMethod.GET)
	public ModelAndView P_performanceList(@RequestParam(required=false , defaultValue="1") String pg) {
		
		//Paging
		int endNum = Integer.parseInt(pg)*9;
		int startNum = endNum-8;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		int totalA = performanceDAO.getPlayListTotalA();
		
		//Paging
		performancePaging.setCurrentPage(Integer.parseInt(pg));
		performancePaging.setPageBlock(5);
		performancePaging.setPageSize(9);
		performancePaging.setTotalA(totalA);

		performancePaging.makePagingHTML();
		
		//DB
		List<EventboardDTO> list = performanceDAO.getPlayList(map);
		
		ModelAndView mav = new ModelAndView();
		
		//String 타입 날짜를 Date 형식으로 변환
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setStartDate(list.get(i).getStartDate().substring(0, 10));
			list.get(i).setEndDate(list.get(i).getEndDate().substring(0, 10));
		}
		
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("listSize", list.size()+"");
		mav.addObject("performancePaging", performancePaging);
		mav.addObject("display", "/performance/P_performanceList.jsp");
		mav.setViewName("P_performanceForm");
		return mav;
		
	}	
	
	//전시회일정를 데이터베이스에서 불러와 달력으로 보내준다.
	@RequestMapping(value="P_exhibitionSchedule", method=RequestMethod.GET)
	public ModelAndView P_exhibitionSchedule(ModelMap modelMap) {
		List<EventboardDTO> list = performanceDAO.getPerformance();
		
		for(EventboardDTO data : list) {
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
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/performance/P_exhibitionCalendar.jsp");
		mav.setViewName("/performance/P_performanceForm");
		return mav ;
	}
	
	//전시회 일정 리스트
	@RequestMapping(value="P_exhibitionList", method=RequestMethod.GET)
	public ModelAndView P_exhibitionList(@RequestParam(required=false , defaultValue="1") String pg) {
		
		//Paging
		int endNum = Integer.parseInt(pg)*9;
		int startNum = endNum-8;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		int totalA = performanceDAO.getExhibitionListTotalA();
		
		//Paging
		performancePaging.setCurrentPage(Integer.parseInt(pg));
		performancePaging.setPageBlock(5);
		performancePaging.setPageSize(9);
		performancePaging.setTotalA(totalA);

		performancePaging.makePagingHTML_exhibition();
		
		//DB
		List<EventboardDTO> list = performanceDAO.getExhibitionList(map);
		
		ModelAndView mav = new ModelAndView();
		//String 타입 날짜를 Date 형식으로 변환
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setStartDate(list.get(i).getStartDate().substring(0, 10));
			list.get(i).setEndDate(list.get(i).getEndDate().substring(0, 10));
		}
			
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("listSize", list.size()+"");
		mav.addObject("performancePaging", performancePaging);
		mav.addObject("display", "/performance/P_exhibitionList.jsp");
		mav.setViewName("P_performanceForm");
		return mav;
	}
	
	//공연 예약하기 폼
	@RequestMapping(value="performanceBook", method=RequestMethod.GET)
	public ModelAndView performanceBook(@RequestParam String seq) {
		
		//DB
		EventboardDTO eventboardDTO = performanceDAO.performanceBook(seq);
		
		//String 타입 날짜를 Date 형식으로 변환
		eventboardDTO.setStartDate(eventboardDTO.getStartDate().substring(0, 10));
		eventboardDTO.setEndDate(eventboardDTO.getEndDate().substring(0, 10));
		
		String startDate = eventboardDTO.getStartDate();
		String endDate = eventboardDTO.getEndDate();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yy-MM-dd");
		
		long diff = 0;
		long diffDays = 0;
		Date startDateF = null;
		
		try {
			startDateF = formatter.parse(startDate);
			Date endDateF = formatter.parse(endDate);
			
			diff = endDateF.getTime() - startDateF.getTime();
			diffDays = diff / (24*60*60*1000);	//종료일-시작일 = 행사 일 수
			
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		Calendar calStart = Calendar.getInstance();
		calStart.setTime(startDateF);
		
		List<Date> listDate = new ArrayList<Date>();
		for(int i=0; i<=diffDays; i++) {
			
			listDate.add(calStart.getTime());
			calStart.add(Calendar.DATE, 1);
		}
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("eventboardDTO", eventboardDTO);
		mav.addObject("listDate", listDate);
		mav.addObject("display", "/performance/P_performanceBook.jsp");
		mav.setViewName("P_performanceForm");
		return mav;
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
