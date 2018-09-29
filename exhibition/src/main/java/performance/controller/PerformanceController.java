package performance.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import company.bean.CompanyDTO;
import customerService.bean.EventboardDTO;
import customerService.bean.ExhibitionBookDTO;
import member.bean.MemberDTO;
import performance.bean.Book_exhibition_membersDTO;
import performance.bean.Book_performance_membersDTO;
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
	@Autowired
	Book_performance_membersDTO book_performance_membersDTO;
	@Autowired
	ExhibitionBookDTO exhibitionBookDTO;
	@Autowired
	Book_exhibition_membersDTO book_exhibition_membersDTO;
	
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
	
	//이번달 전체일정 리스트
	@RequestMapping(value="P_allScheduleList", method=RequestMethod.GET)
	public ModelAndView P_allScheduleList(@RequestParam(required=false , defaultValue="1") String pg) {	
		//Paging
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("YYMM");
		String dateS = formatter.format(date);
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		map.put("dateS", Integer.parseInt(dateS));
		
		int totalA = performanceDAO.getAllListTotalA(map);
		
		//Paging
		performancePaging.setCurrentPage(Integer.parseInt(pg));
		performancePaging.setPageBlock(3);
		performancePaging.setPageSize(5);
		performancePaging.setTotalA(totalA);

		performancePaging.makePagingHTML();
		
		//DB
		List<EventboardDTO> list = performanceDAO.getAllExhibitionList(map);
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setStartDate(list.get(i).getStartDate().substring(0, 10));
			list.get(i).setEndDate(list.get(i).getEndDate().substring(0, 10));
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("listSize", list.size()+"");
		mav.addObject("pg", pg);
		mav.addObject("performancePaging", performancePaging);
		mav.addObject("display","/performance/P_allCalendarList.jsp");
		mav.setViewName("/performance/P_performanceForm");
		return mav ;
	}
	
	//3개월 이전 전체행사 리스트
	@RequestMapping(value="P_allScheduleList_Prev", method=RequestMethod.GET)
	public ModelAndView P_allScheduleList_Prev(@RequestParam(required=false , defaultValue="1") String pg) {	
		//Paging
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;	
		
		Date date = new Date();						//현재 날짜의 월
		SimpleDateFormat formatter = new SimpleDateFormat("YYMM");
		String dateM = formatter.format(date);
		
		Calendar cal = Calendar.getInstance();
		cal.add(cal.MONTH, -3);
		String beforeYear = formatter.format(cal.getTime()).substring(0,2);
		String beforeMonth = formatter.format(cal.getTime()).substring(2,4);
		
		String dateS= beforeYear+beforeMonth;

		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		map.put("dateS", Integer.parseInt(dateS));
		map.put("dateM", Integer.parseInt(dateM));
		
		int totalA = performanceDAO.getAllListTotalA_Prev(map);
		
		//Paging
		performancePaging.setCurrentPage(Integer.parseInt(pg));
		performancePaging.setPageBlock(3);
		performancePaging.setPageSize(5);
		performancePaging.setTotalA(totalA);

		performancePaging.makePagingHTML();
		
		//DB
		List<EventboardDTO> list = performanceDAO.getAllExhibitionList_Prev(map);
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setStartDate(list.get(i).getStartDate().substring(0, 10));
			list.get(i).setEndDate(list.get(i).getEndDate().substring(0, 10));
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("listSize", list.size()+"");
		mav.addObject("pg", pg);
		mav.addObject("performancePaging", performancePaging);
		mav.addObject("display","/performance/P_allScheduleList_Prev.jsp");
		mav.setViewName("/performance/P_performanceForm");
		return mav ;
	}
	
	//3개월 이후 전체행사 리스트
		@RequestMapping(value="P_allScheduleList_After", method=RequestMethod.GET)
		public ModelAndView P_allScheduleList_After(@RequestParam(required=false , defaultValue="1") String pg) {	
			//Paging
			int endNum = Integer.parseInt(pg)*5;
			int startNum = endNum-4;	
			
			Date date = new Date();						//현재 날짜의 월
			SimpleDateFormat formatter = new SimpleDateFormat("YYMM");
			String dateM = formatter.format(date);
			
			Calendar cal = Calendar.getInstance();
			cal.add(cal.MONTH, +3);
			String beforeYear = formatter.format(cal.getTime()).substring(0,2);
			String beforeMonth = formatter.format(cal.getTime()).substring(2,4);
			
			String dateS= beforeYear+beforeMonth;
			System.out.println(dateS);
			Map<String,Integer> map = new HashMap<String,Integer>();
			map.put("endNum", endNum);
			map.put("startNum", startNum);
			map.put("dateS", Integer.parseInt(dateS));
			map.put("dateM", Integer.parseInt(dateM));
			
			int totalA = performanceDAO.getAllListTotalA_After(map);
			
			//Paging
			performancePaging.setCurrentPage(Integer.parseInt(pg));
			performancePaging.setPageBlock(3);
			performancePaging.setPageSize(5);
			performancePaging.setTotalA(totalA);

			performancePaging.makePagingHTML();
			
			//DB
			List<EventboardDTO> list = performanceDAO.getAllExhibitionList_After(map);
			for(int i = 0; i < list.size(); i++) {
				list.get(i).setStartDate(list.get(i).getStartDate().substring(0, 10));
				list.get(i).setEndDate(list.get(i).getEndDate().substring(0, 10));
			}
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.addObject("listSize", list.size()+"");
			mav.addObject("pg", pg);
			mav.addObject("performancePaging", performancePaging);
			mav.addObject("display","/performance/P_allScheduleList_After.jsp");
			mav.setViewName("/performance/P_performanceForm");
			return mav ;
		}

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
	public ModelAndView P_performanceList(@RequestParam(required=false , defaultValue="1") String pg, HttpSession session) {
		
		Object object = null;
		
		try {
			//회원의 코드 값 얻기
			object = session.getAttribute("homepageMember");

			if(object.toString().equals("1")) {
				object = (MemberDTO)object;
				
			}else if(object.toString().equals("2")) {
				object = (CompanyDTO)object;
				
			}else if(object.toString().equals("3")) {
				object = (MemberDTO)object;
			}else {
				object = "guest";
			}
		} catch (Exception e) {
			
		}
		
		System.out.println("회원의 코드 : "+object);
		
		
		//회원의 아이디 값 얻기
		MemberDTO memberDTO = null;
		CompanyDTO companyDTO = null;
		String id = null;
		
		try {
			if(object.toString().equals("1")) {
				memberDTO = (MemberDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+memberDTO.getM_Id());
				id = memberDTO.getM_Id();
				
			}else if(object.toString().equals("2")) {
				companyDTO = (CompanyDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+companyDTO.getC_license());
				id = companyDTO.getC_license();
				
			}else if(object.toString().equals("3")) {
				System.out.println("얻은 아이디 : manager");
				id = "manager";
			}else {
				System.out.println("얻은 아이디 : guest");
				id = "guest";
			}
		} catch (Exception e) {
			
		}
		
		//Paging
		int endNum = Integer.parseInt(pg)*9;
		int startNum = endNum-8;
		
		//현재 날짜
		Date currentDate = new Date();
			
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		
		String startDateC = formatter.format(currentDate);
		
		String selMonth = startDateC.substring(0, 8) + "01";
		
		System.out.println("월 : "+ selMonth);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		map.put("selMonth", selMonth);
		
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
		
		mav.addObject("id", id);
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("listSize", list.size()+"");
		mav.addObject("performancePaging", performancePaging);
		mav.addObject("display", "/performance/P_performanceList.jsp");
		mav.setViewName("/performance/P_performanceForm");
		return mav;
		
	}
	
	//다음 공연일정 리스트(3개월 치)
	@RequestMapping(value="P_next_performanceList", method=RequestMethod.GET)
	public ModelAndView P_next_performanceList(@RequestParam(required=false , defaultValue="1") String pg, HttpSession session) {
		
		Object object = null;
		
		try {
			//회원의 코드 값 얻기
			object = session.getAttribute("homepageMember");

			if(object.toString().equals("1")) {
				object = (MemberDTO)object;
				
			}else if(object.toString().equals("2")) {
				object = (CompanyDTO)object;
				
			}else if(object.toString().equals("3")) {
				object = (MemberDTO)object;
			}else {
				object = "guest";
			}
		} catch (Exception e) {
			
		}
		
		System.out.println("회원의 코드 : "+object);
		
		
		//회원의 아이디 값 얻기
		MemberDTO memberDTO = null;
		CompanyDTO companyDTO = null;
		String id = null;
		
		try {
			if(object.toString().equals("1")) {
				memberDTO = (MemberDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+memberDTO.getM_Id());
				id = memberDTO.getM_Id();
				
			}else if(object.toString().equals("2")) {
				companyDTO = (CompanyDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+companyDTO.getC_license());
				id = companyDTO.getC_license();
				
			}else if(object.toString().equals("3")) {
				System.out.println("얻은 아이디 : manager");
				id = "manager";
			}else {
				System.out.println("얻은 아이디 : guest");
				id = "guest";
			}
		} catch (Exception e) {
			
		}
		
		//Paging
		int endNum = Integer.parseInt(pg)*9;
		int startNum = endNum-8;
		
		//현재 날짜
		Date currentDate = new Date();
			
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		
		String startDateC = formatter.format(currentDate);

		String selMonth = startDateC.substring(0, 8) + "01";
		System.out.println("월 : "+ selMonth);	//현재 월
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		map.put("selMonth", selMonth);
		
		int totalA = performanceDAO.getNextPlayListTotalA(map);	//연극 3개월 후 일정 수 가져오는 메소드
		
		//Paging
		performancePaging.setCurrentPage(Integer.parseInt(pg));
		performancePaging.setPageBlock(5);
		performancePaging.setPageSize(9);
		performancePaging.setTotalA(totalA);

		performancePaging.makeNextPagingHTML_play();
		
		//DB
		List<EventboardDTO> list = performanceDAO.getNextPlayList(map);
		
		ModelAndView mav = new ModelAndView();
		
		//String 타입 날짜를 Date 형식으로 변환
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setStartDate(list.get(i).getStartDate().substring(0, 10));
			list.get(i).setEndDate(list.get(i).getEndDate().substring(0, 10));
		}
		
		mav.addObject("id", id);
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("listSize", list.size()+"");
		mav.addObject("performancePaging", performancePaging);
		mav.addObject("display", "/performance/P_performanceList.jsp");
		mav.setViewName("/performance/P_performanceForm");
		return mav;
		
	}
	
	//이전 공연일정 리스트(3개월 치)
	@RequestMapping(value="P_prev_performanceList", method=RequestMethod.GET)
	public ModelAndView P_prev_performanceList(@RequestParam(required=false , defaultValue="1") String pg, HttpSession session) {
		
		Object object = null;
		
		try {
			//회원의 코드 값 얻기
			object = session.getAttribute("homepageMember");

			if(object.toString().equals("1")) {
				object = (MemberDTO)object;
				
			}else if(object.toString().equals("2")) {
				object = (CompanyDTO)object;
				
			}else if(object.toString().equals("3")) {
				object = (MemberDTO)object;
			}else {
				object = "guest";
			}
		} catch (Exception e) {
			
		}
		
		System.out.println("회원의 코드 : "+object);
		
		
		//회원의 아이디 값 얻기
		MemberDTO memberDTO = null;
		CompanyDTO companyDTO = null;
		String id = null;
		
		try {
			if(object.toString().equals("1")) {
				memberDTO = (MemberDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+memberDTO.getM_Id());
				id = memberDTO.getM_Id();
				
			}else if(object.toString().equals("2")) {
				companyDTO = (CompanyDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+companyDTO.getC_license());
				id = companyDTO.getC_license();
				
			}else if(object.toString().equals("3")) {
				System.out.println("얻은 아이디 : manager");
				id = "manager";
			}else {
				System.out.println("얻은 아이디 : guest");
				id = "guest";
			}
		} catch (Exception e) {
			
		}
		
		//Paging
		int endNum = Integer.parseInt(pg)*9;
		int startNum = endNum-8;
		
		//현재 날짜
		Date currentDate = new Date();
			
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		
		String startDateC = formatter.format(currentDate);

		String selMonth = startDateC.substring(0, 8) + "01";
		System.out.println("월 : "+ selMonth);	//현재 월
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		map.put("selMonth", selMonth);
		
		int totalA = performanceDAO.getPrevPlayListTotalA(map);	//연극 3개월 후 일정 수 가져오는 메소드
		
		//Paging
		performancePaging.setCurrentPage(Integer.parseInt(pg));
		performancePaging.setPageBlock(5);
		performancePaging.setPageSize(9);
		performancePaging.setTotalA(totalA);

		performancePaging.makePrevPagingHTML_play();
		
		//DB
		List<EventboardDTO> list = performanceDAO.getPrevPlayList(map);
		
		ModelAndView mav = new ModelAndView();
		
		//String 타입 날짜를 Date 형식으로 변환
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setStartDate(list.get(i).getStartDate().substring(0, 10));
			list.get(i).setEndDate(list.get(i).getEndDate().substring(0, 10));
		}
		
		mav.addObject("id", id);
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("listSize", list.size()+"");
		mav.addObject("performancePaging", performancePaging);
		mav.addObject("display", "/performance/P_performanceList.jsp");
		mav.setViewName("/performance/P_performanceForm");
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
		
		//현재 날짜
		Date currentDate = new Date();
			
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		
		String startDateC = formatter.format(currentDate);
		
		String selMonth = startDateC.substring(0, 8) + "01";
		
		System.out.println("월 : "+ selMonth);
		
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		map.put("selMonth", selMonth);
		
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
		mav.setViewName("/performance/P_performanceForm");
		return mav;
	}
	
	//다음 전시회일정 리스트(3개월 치)
	@RequestMapping(value="P_next_exhibitionList", method=RequestMethod.GET)
	public ModelAndView P_next_exhibitionList(@RequestParam(required=false , defaultValue="1") String pg, HttpSession session) {
		
		Object object = null;
		
		try {
			//회원의 코드 값 얻기
			object = session.getAttribute("homepageMember");

			if(object.toString().equals("1")) {
				object = (MemberDTO)object;
				
			}else if(object.toString().equals("2")) {
				object = (CompanyDTO)object;
				
			}else if(object.toString().equals("3")) {
				object = (MemberDTO)object;
			}else {
				object = "guest";
			}
		} catch (Exception e) {
			
		}
		
		System.out.println("회원의 코드 : "+object);
		
		
		//회원의 아이디 값 얻기
		MemberDTO memberDTO = null;
		CompanyDTO companyDTO = null;
		String id = null;
		
		try {
			if(object.toString().equals("1")) {
				memberDTO = (MemberDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+memberDTO.getM_Id());
				id = memberDTO.getM_Id();
				
			}else if(object.toString().equals("2")) {
				companyDTO = (CompanyDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+companyDTO.getC_license());
				id = companyDTO.getC_license();
				
			}else if(object.toString().equals("3")) {
				System.out.println("얻은 아이디 : manager");
				id = "manager";
			}else {
				System.out.println("얻은 아이디 : guest");
				id = "guest";
			}
		} catch (Exception e) {
			
		}
		
		//Paging
		int endNum = Integer.parseInt(pg)*9;
		int startNum = endNum-8;
		
		//현재 날짜
		Date currentDate = new Date();
			
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		
		String startDateC = formatter.format(currentDate);

		String selMonth = startDateC.substring(0, 8) + "01";
		System.out.println("월 : "+ selMonth);	//현재 월
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		map.put("selMonth", selMonth);
		
		int totalA = performanceDAO.getNextExhibitionListTotalA(map);	//연극 3개월 후 일정 수 가져오는 메소드
		
		//Paging
		performancePaging.setCurrentPage(Integer.parseInt(pg));
		performancePaging.setPageBlock(5);
		performancePaging.setPageSize(9);
		performancePaging.setTotalA(totalA);

		performancePaging.makeNextPagingHTML_exhibition();
		
		//DB
		List<EventboardDTO> list = performanceDAO.getNextExhibitionList(map);
		
		ModelAndView mav = new ModelAndView();
		
		//String 타입 날짜를 Date 형식으로 변환
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setStartDate(list.get(i).getStartDate().substring(0, 10));
			list.get(i).setEndDate(list.get(i).getEndDate().substring(0, 10));
		}
		
		mav.addObject("id", id);
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("listSize", list.size()+"");
		mav.addObject("performancePaging", performancePaging);
		mav.addObject("display", "/performance/P_exhibitionList.jsp");
		mav.setViewName("/performance/P_performanceForm");
		return mav;
		
	}
	
	//이전 전시회일정 리스트(3개월 치)
	@RequestMapping(value="P_prev_exhibitionList", method=RequestMethod.GET)
	public ModelAndView P_prev_exhibitionList(@RequestParam(required=false , defaultValue="1") String pg, HttpSession session) {
		
		Object object = null;
		
		try {
			//회원의 코드 값 얻기
			object = session.getAttribute("homepageMember");

			if(object.toString().equals("1")) {
				object = (MemberDTO)object;
				
			}else if(object.toString().equals("2")) {
				object = (CompanyDTO)object;
				
			}else if(object.toString().equals("3")) {
				object = (MemberDTO)object;
			}else {
				object = "guest";
			}
		} catch (Exception e) {
			
		}
		
		System.out.println("회원의 코드 : "+object);
		
		
		//회원의 아이디 값 얻기
		MemberDTO memberDTO = null;
		CompanyDTO companyDTO = null;
		String id = null;
		
		try {
			if(object.toString().equals("1")) {
				memberDTO = (MemberDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+memberDTO.getM_Id());
				id = memberDTO.getM_Id();
				
			}else if(object.toString().equals("2")) {
				companyDTO = (CompanyDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+companyDTO.getC_license());
				id = companyDTO.getC_license();
				
			}else if(object.toString().equals("3")) {
				System.out.println("얻은 아이디 : manager");
				id = "manager";
			}else {
				System.out.println("얻은 아이디 : guest");
				id = "guest";
			}
		} catch (Exception e) {
			
		}
		
		//Paging
		int endNum = Integer.parseInt(pg)*9;
		int startNum = endNum-8;
		
		//현재 날짜
		Date currentDate = new Date();
			
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		
		String startDateC = formatter.format(currentDate);

		String selMonth = startDateC.substring(0, 8) + "01";
		System.out.println("월 : "+ selMonth);	//현재 월
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		map.put("selMonth", selMonth);
		
		int totalA = performanceDAO.getPrevExhibitionListTotalA(map);	//연극 3개월 후 일정 수 가져오는 메소드
		
		//Paging
		performancePaging.setCurrentPage(Integer.parseInt(pg));
		performancePaging.setPageBlock(5);
		performancePaging.setPageSize(9);
		performancePaging.setTotalA(totalA);

		performancePaging.makePrevPagingHTML_exhibition();
		
		//DB
		List<EventboardDTO> list = performanceDAO.getPrevExhibitionList(map);
		
		ModelAndView mav = new ModelAndView();
		
		//String 타입 날짜를 Date 형식으로 변환
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setStartDate(list.get(i).getStartDate().substring(0, 10));
			list.get(i).setEndDate(list.get(i).getEndDate().substring(0, 10));
		}
		
		mav.addObject("id", id);
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("listSize", list.size()+"");
		mav.addObject("performancePaging", performancePaging);
		mav.addObject("display", "/performance/P_exhibitionList.jsp");
		mav.setViewName("/performance/P_performanceForm");
		return mav;
		
	}

	//전시회 예약하기 폼
	@RequestMapping(value="exhibitionBook", method=RequestMethod.GET)
	public ModelAndView exhibitionBook(@RequestParam(required=false , defaultValue="1") String seq, HttpSession session) {
		
		Object object = null;
		
		try {
			//회원의 코드 값 얻기
			object = session.getAttribute("homepageMember");
			
			if(object.toString().equals("1")) {
				object = (MemberDTO)object;
				
			}else if(object.toString().equals("2")) {
				object = (CompanyDTO)object;
			}else if(object.toString().equals("3")) {
				object = (MemberDTO)object;
			}else {
				object = "guest";
			}
		} catch (Exception e) {
			
		}
		
		System.out.println("회원의 코드 : "+object);
		
		//회원의 아이디 값 얻기
		MemberDTO memberDTO = null;
		CompanyDTO companyDTO = null;
		String id = null;
		
		try {
			if(object.toString().equals("1")) {
				memberDTO = (MemberDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+memberDTO.getM_Id());
				id = memberDTO.getM_Id();
				
			}else if(object.toString().equals("2")) {
				companyDTO = (CompanyDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+companyDTO.getC_license());
				id = companyDTO.getC_license();
				
			}else if(object.toString().equals("3")) {
				System.out.println("얻은 아이디 : manager");
				id = "manager";
			}else {
				System.out.println("얻은 아이디 : guest");
				id = "guest";
			}
		} catch (Exception e) {
			
		}
		
		//DB
		EventboardDTO eventboardDTO = performanceDAO.exhibitionBook(seq);
		
		//String 타입 날짜를 Date 형식으로 변환
		eventboardDTO.setStartDate(eventboardDTO.getStartDate().substring(0, 10));
		eventboardDTO.setEndDate(eventboardDTO.getEndDate().substring(0, 10));
		
		System.out.println(eventboardDTO.getStartDate());
		System.out.println(eventboardDTO.getEndDate());
		
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
		
		mav.addObject("id", id);
		mav.addObject("eventboardDTO", eventboardDTO);
		mav.addObject("listDate", listDate);
		mav.addObject("display", "/performance/P_exhibitionBook.jsp");
		mav.setViewName("P_performanceForm");
		return mav;
	}
	
	//전시회 예매(ajax)
	@RequestMapping(value="book_exhibition", method=RequestMethod.POST)
	public @ResponseBody String book_exhibition(@RequestParam String imageName, @RequestParam String playDate, @RequestParam String ticketQty, HttpSession session) {
		
		Object object = null;
		
		try {
			//회원의 코드 값 얻기
			object = session.getAttribute("homepageMember");
			
			if(object.toString().equals("1")) {
				object = (MemberDTO)object;
			}else if(object.toString().equals("2")) {
				object = (CompanyDTO)object;
			}else if(object.toString().equals("3")) {
				object = (MemberDTO)object;
			}else {
				object = "guest";
			}
		} catch (Exception e) {
			
		}
		
		System.out.println("회원의 코드 : "+object);
		
		//회원의 아이디 값 얻기
		MemberDTO memberDTO = null;
		CompanyDTO companyDTO = null;
		String id = null;
		
		try {
			if(object.toString().equals("1")) {
				memberDTO = (MemberDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+memberDTO.getM_Id());
				id = memberDTO.getM_Id();
				
			}else if(object.toString().equals("2")) {
				companyDTO = (CompanyDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+companyDTO.getC_license());
				id = companyDTO.getC_license();
				
			}else if(object.toString().equals("3")) {
				System.out.println("얻은 아이디 : manager");
				id = "manager";
			}else {
				System.out.println("얻은 아이디 : guest");
				id = "guest";
			}
		} catch (Exception e) {
			
		}
		
		//날짜 형식 변경(년,월,일 제거)
		playDate=playDate.replace("년", "");
		playDate=playDate.replace("월", "");
		playDate=playDate.replace("일", "");
		
		System.out.println("공연명 : "+imageName);
		System.out.println("공연 날짜 : "+playDate);
		System.out.println("예매 아이디 : "+id);
		System.out.println("티켓 수 : " + ticketQty);
		
		//예매자 정보 DTO 담기
		book_exhibition_membersDTO.setImageName(imageName);
		book_exhibition_membersDTO.setPlayDate(playDate);
		book_exhibition_membersDTO.setMemberId(id);
		book_exhibition_membersDTO.setTicketQty(ticketQty);
		
		//DB (예매자 등록 DB)
		int result = performanceDAO.bookExhibitionMembers(book_exhibition_membersDTO);
		performanceDAO.bookExhibitionMembers_calculate(book_exhibition_membersDTO);	//예매한 티켓 만큼 잔여티켓 계산해주기
		
		if(result==0) return "fail";
		else return "ok";
	}
	
	
	//연극 예약하기 폼
	@RequestMapping(value="performanceBook", method=RequestMethod.GET)
	public ModelAndView performanceBook(@RequestParam(required=false , defaultValue="1") String seq, HttpSession session) {
		
		Object object = null;
		
		try {
			//회원의 코드 값 얻기
			object = session.getAttribute("homepageMember");
			
			if(object.toString().equals("1")) {
				object = (MemberDTO)object;
				
			}else if(object.toString().equals("2")) {
				object = (CompanyDTO)object;
			}else if(object.toString().equals("3")) {
				object = (MemberDTO)object;
			}else {
				object = "guest";
			}
		} catch (Exception e) {
			
		}
		
		System.out.println("회원의 코드 : "+object);
		
		//회원의 아이디 값 얻기
		MemberDTO memberDTO = null;
		CompanyDTO companyDTO = null;
		String id = null;
		
		try {
			if(object.toString().equals("1")) {
				memberDTO = (MemberDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+memberDTO.getM_Id());
				id = memberDTO.getM_Id();
				
			}else if(object.toString().equals("2")) {
				companyDTO = (CompanyDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+companyDTO.getC_license());
				id = companyDTO.getC_license();
				
			}else if(object.toString().equals("3")) {
				System.out.println("얻은 아이디 : manager");
				id = "manager";
			}else {
				System.out.println("얻은 아이디 : guest");
				id = "guest";
			}
		} catch (Exception e) {
			
		}
		
		//DB
		EventboardDTO eventboardDTO = performanceDAO.performanceBook(seq);
		
		//String 타입 날짜를 Date 형식으로 변환
		eventboardDTO.setStartDate(eventboardDTO.getStartDate().substring(0, 10));
		eventboardDTO.setEndDate(eventboardDTO.getEndDate().substring(0, 10));
		
		System.out.println(eventboardDTO.getStartDate());
		System.out.println(eventboardDTO.getEndDate());
		
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
		
		mav.addObject("id", id);
		mav.addObject("eventboardDTO", eventboardDTO);
		mav.addObject("listDate", listDate);
		mav.addObject("display", "/performance/P_performanceBook.jsp");
		mav.setViewName("P_performanceForm");
		return mav;
	}
	
	//연극 예매(ajax)
	@RequestMapping(value="book_performance", method=RequestMethod.POST)
	public @ResponseBody String book_performance(@RequestParam String imageName, @RequestParam String playDate, @RequestParam String ticketQty, HttpSession session) {
		
		Object object = null;
		
		try {
			//회원의 코드 값 얻기
			object = session.getAttribute("homepageMember");
			
			if(object.toString().equals("1")) {
				object = (MemberDTO)object;
				
			}else if(object.toString().equals("2")) {
				object = (CompanyDTO)object;
			}else if(object.toString().equals("3")) {
				object = (MemberDTO)object;
			}else {
				object = "guest";
			}
		} catch (Exception e) {
			
		}
		
		System.out.println("회원의 코드 : "+object);
		
		//회원의 아이디 값 얻기
		MemberDTO memberDTO = null;
		CompanyDTO companyDTO = null;
		String id = null;
		
		try {
			if(object.toString().equals("1")) {
				memberDTO = (MemberDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+memberDTO.getM_Id());
				id = memberDTO.getM_Id();
				
			}else if(object.toString().equals("2")) {
				companyDTO = (CompanyDTO)session.getAttribute("homepageMember");
				System.out.println("얻은 아이디 : "+companyDTO.getC_license());
				id = companyDTO.getC_license();
				
			}else if(object.toString().equals("3")) {
				System.out.println("얻은 아이디 : manager");
				id = "manager";
			}else {
				System.out.println("얻은 아이디 : guest");
				id = "guest";
			}
		} catch (Exception e) {
			
		}
		
		//날짜 형식 변경(년,월,일 제거)
		playDate=playDate.replace("년", "");
		playDate=playDate.replace("월", "");
		playDate=playDate.replace("일", "");
		
				
		System.out.println("공연명 : "+imageName);
		System.out.println("공연 날짜 : "+playDate);
		System.out.println("예매 아이디 : "+id);
		System.out.println("티켓 수 : " + ticketQty);
		
		//예매자 정보 DTO 담기
		book_performance_membersDTO.setImageName(imageName);
		book_performance_membersDTO.setPlayDate(playDate);
		book_performance_membersDTO.setMemberId(id);
		book_performance_membersDTO.setTicketQty(ticketQty);
		
		//DB (예매자 등록 DB)
		int result = performanceDAO.bookPlayMembers(book_performance_membersDTO);
		performanceDAO.bookPlayMembers_calculate(book_performance_membersDTO);	//예매한 티켓 만큼 잔여티켓 계산해주기
		
		if(result==0) return "fail";
		else return "ok";
	}
	
	//연극 잔여좌석 확인하기(ajax)
	@RequestMapping(value="book_performance_remainSeats", method=RequestMethod.POST)
	public @ResponseBody String book_performance_remainSeats(@RequestParam int totalSeats, @RequestParam String imageName, @RequestParam String playDate) {

		System.out.println("총 좌석 수 : "+ totalSeats);
		System.out.println("연극 명 : "+ imageName);
		System.out.println("연극 날짜 : "+playDate);
				
		if(playDate.equals("날짜선택")) {
			playDate = "2000년01월01일";
		}
		
		//날짜 형식 변경(년,월,일 제거)
		playDate=playDate.replace("년", "");
		playDate=playDate.replace("월", "");
		playDate=playDate.replace("일", "");
		
		//진행중
		Map<String,String> map = new HashMap<String,String>();
		map.put("imageName", imageName);
		map.put("playDate", playDate);
		
		//DB
		String remainSeats = performanceDAO.checkRemainSeats(map);	//선택일자의 해당 연극 전체좌석 가져오기(기본값:일별 티켓 발행 수)
		String usedSeats = performanceDAO.checkUsedSeats(map);		//선택일자의  해당 연극 예매된 티켓 수 가져오기
		
		System.out.println("전체석 : "+remainSeats);
		System.out.println("예매석 : "+usedSeats);
		
		if(remainSeats==null) remainSeats = 0+"";
		if(usedSeats==null) usedSeats = 0+"";
	
		
		//잔여좌석 - 예매된 티켓 수 = 예매 가능한 좌석 수
		int resultSeats = Integer.parseInt(remainSeats) - Integer.parseInt(usedSeats);
				
		//null값이면 ***
		
		if(resultSeats==0 && usedSeats.equals("0") && remainSeats.equals("0")) {
			if(playDate.equals("20000101")) {
				return "choseDate";
			}else {
				return "remainSeats";
			}
			
		}else if(resultSeats==0) {
			return "noSeats";
		}else if(resultSeats>0){
			return resultSeats+"";
		}else {
			return "choseDate";
		} 
	}
	
	//전시회 잔여좌석 확인하기(ajax)
	@RequestMapping(value="book_exhibition_remainSeats", method=RequestMethod.POST)
	public @ResponseBody String book_exhibition_remainSeats(@RequestParam int totalSeats, @RequestParam String imageName, @RequestParam String playDate) {

		System.out.println("총 좌석 수 : "+ totalSeats);
		System.out.println("연극 명 : "+ imageName);
		System.out.println("연극 날짜 : "+playDate);
				
		if(playDate.equals("날짜선택")) {
			playDate = "2000년01월01일";
		}
		
		//날짜 형식 변경(년,월,일 제거)
		playDate=playDate.replace("년", "");
		playDate=playDate.replace("월", "");
		playDate=playDate.replace("일", "");
		
		//진행중
		Map<String,String> map = new HashMap<String,String>();
		map.put("imageName", imageName);
		map.put("playDate", playDate);
		
		//DB
		String remainSeats = performanceDAO.checkRemainSeats_ex(map);	//선택일자의 해당 연극 전체좌석 가져오기(기본값:일별 티켓 발행 수)
		String usedSeats = performanceDAO.checkUsedSeats_ex(map);		//선택일자의  해당 연극 예매된 티켓 수 가져오기
		
		System.out.println("전체석 : "+remainSeats);
		System.out.println("예매석 : "+usedSeats);
		
		if(remainSeats==null) remainSeats = 0+"";
		if(usedSeats==null) usedSeats = 0+"";
	
		
		//잔여좌석 - 예매된 티켓 수 = 예매 가능한 좌석 수
		int resultSeats = Integer.parseInt(remainSeats) - Integer.parseInt(usedSeats);
				
		//null값이면 ***
		
		if(resultSeats==0 && usedSeats.equals("0") && remainSeats.equals("0")) {
			if(playDate.equals("20000101")) {
				return "choseDate";
			}else {
				return "remainSeats";
			}
			
		}else if(resultSeats==0) {
			return "noSeats";
		}else if(resultSeats>0){
			return resultSeats+"";
		}else {
			return "choseDate";
		}  
	}
	
	//전시회 잔여좌석 보다 구매티켓이 높을 경우 구매 못하게 막음
	@RequestMapping(value="book_exhibition_checkBuy", method=RequestMethod.POST)
	public @ResponseBody String book_exhibition_checkBuy(@RequestParam String wantTicket, @RequestParam String imageName, @RequestParam String playDate) {
		
		if(playDate.equals("날짜선택")) {
			playDate = "2000년01월01일";
		}
		
		//날짜 형식 변경(년,월,일 제거)
		playDate=playDate.replace("년", "");
		playDate=playDate.replace("월", "");
		playDate=playDate.replace("일", "");
		
		//Map에 담기
		Map<String,String> map = new HashMap<String,String>();
		map.put("imageName", imageName);
		map.put("playDate", playDate);
		
		//DB
		String remainSeats = performanceDAO.checkRemainSeats_ex(map);	//선택일자의 해당 전시회 전체좌석 가져오기(기본값:일별 티켓 발행 수)
		String usedSeats = performanceDAO.checkUsedSeats_ex(map);		//선택일자의  해당 전시회 예매된 티켓 수 가져오기
		
		if(remainSeats==null) remainSeats = 0+"";
		if(usedSeats==null) usedSeats = 0+"";
	
		//잔여좌석 - 예매된 티켓 수 = 예매 가능한 좌석 수()
		int resultSeats = Integer.parseInt(remainSeats) - Integer.parseInt(usedSeats);
		
		if(resultSeats - Integer.parseInt(wantTicket) >= 0) {
			return "ok";
		}else
			return "no";
	}
	
	//연극 잔여좌석 보다 구매티켓이 높을 경우 구매 못하게 막음
	@RequestMapping(value="book_play_checkBuy", method=RequestMethod.POST)
	public @ResponseBody String book_play_checkBuy(@RequestParam String wantTicket, @RequestParam String imageName, @RequestParam String playDate) {
		
		if(playDate.equals("날짜선택")) {
			playDate = "2000년01월01일";
		}
		
		//날짜 형식 변경(년,월,일 제거)
		playDate=playDate.replace("년", "");
		playDate=playDate.replace("월", "");
		playDate=playDate.replace("일", "");
		
		//Map에 담기
		Map<String,String> map = new HashMap<String,String>();
		map.put("imageName", imageName);
		map.put("playDate", playDate);
		
		//DB
		String remainSeats = performanceDAO.checkRemainSeats(map);	//선택일자의 해당 연극 전체좌석 가져오기(기본값:일별 티켓 발행 수)
		String usedSeats = performanceDAO.checkUsedSeats(map);		//선택일자의  해당 연극 예매된 티켓 수 가져오기
		
		if(remainSeats==null) remainSeats = 0+"";
		if(usedSeats==null) usedSeats = 0+"";
	
		//잔여좌석 - 예매된 티켓 수 = 예매 가능한 좌석 수()
		int resultSeats = Integer.parseInt(remainSeats) - Integer.parseInt(usedSeats);
		
		if(resultSeats - Integer.parseInt(wantTicket) >= 0) {
			return "ok";
		}else
			return "no";
	}
	
	//날짜 별 전시회, 콘서트 일정 받아오기
	@RequestMapping(value="searchAllList", method = RequestMethod.POST)
	public ModelAndView searchAllList(@RequestParam String date) {
		
		List<EventboardDTO> list = performanceDAO.getAllListExhibition(date);
		List<EventboardDTO> consertList = performanceDAO.getAllListConcert(date);
		
		list.addAll(consertList);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
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
