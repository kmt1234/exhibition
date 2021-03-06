package rental.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import rental.bean.ExhibitionDTO;
import rental.dao.ExhibitionDAO;

@RequestMapping(value="rental")
@Component
public class RentalController {
	
	@Autowired
	ExhibitionDAO exhibitionDAO;
	
	//렌털 정보
	@RequestMapping(value="R_infoForm", method=RequestMethod.GET)
	public String R_infoForm() {
		return "/rental/R_infoForm";
	}
	//전시회
	@RequestMapping(value="R_exhibitionForm", method=RequestMethod.GET)
	public String R_exhibitionHoll() {
		return "/rental/R_exhibitionForm";
	}
	//콘서트
	@RequestMapping(value="R_exhibitionHollDecision", method=RequestMethod.GET)
	public String R_exhibitionHollDecision(@RequestParam String booth, Model model, ModelMap modelMap) {
		double rate = 0;
		if(booth.equals("Booth1") || booth.equals("Booth2")  || booth.equals("Booth3")  || booth.equals("Booth4")  || booth.equals("Booth7")  || booth.equals("Booth8")  || booth.equals("Booth9")  || booth.equals("Booth10")) {
			rate = 2350*1.0*1.0*2592;
		} else if(booth.equals("Booth5") || booth.equals("Booth6")) {
			rate = 2350*1.0*1.2*6343;
		}
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		
		model.addAttribute("rate", rate);
		model.addAttribute("booth", booth);
		model.addAttribute("date", sdf.format(date));
		
		
		
		List<ExhibitionDTO> list = exhibitionDAO.getCalendar(booth);
		for(ExhibitionDTO data : list) {
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
		
		modelMap.addAttribute("listView", list);
		
		return "/rental/R_exhibitionHollDecisionForm";
	}
	
	@RequestMapping(value="searchRentDay", method=RequestMethod.POST)
	public @ResponseBody String searchRentDay(@RequestParam String booth, @RequestParam String startDate, @RequestParam String endDate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("boothName", booth);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		String result = exhibitionDAO.searchRentDay(map);
		
		return result;
	}
	
	@RequestMapping(value="reservationHoll", method=RequestMethod.POST)
	public String reservationHoll(@RequestParam String booth, @RequestParam String startDate, @RequestParam String endDate, @RequestParam String C_email, @RequestParam String C_license, @RequestParam String C_tel, @RequestParam String title, @RequestParam int totalRent) {
		ExhibitionDTO exhibitionDTO = new ExhibitionDTO();
		exhibitionDTO.setBoothName(booth);
		exhibitionDTO.setC_email(C_email);
		exhibitionDTO.setC_license(C_license);
		exhibitionDTO.setC_tel(C_tel);
		exhibitionDTO.setCode("1");
		exhibitionDTO.setEndDate(endDate);
		exhibitionDTO.setStartDate(startDate);
		exhibitionDTO.setTotalRent(totalRent);
		exhibitionDTO.setTitle(title);
		
		exhibitionDAO.reservationHoll(exhibitionDTO);
		
		return "/rental/R_exhibitionOk";
	}
	
	
	/**
	* 시작일부터 종료일까지 사이의 날짜를 배열에 담아 리턴 ( 시작일과 종료일을 모두 포함한다 )
	* 
	* @param fromDate
	* yyyyMMdd 형식의 시작일
	* @param toDate
	* yyyyMMdd 형식의 종료일
	* @return yyyyMMdd 형식의 날짜가 담긴 배열
	*/
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
	
	/*@RequestMapping(value="getCalendar", method=RequestMethod.POST)
	public ModelAndView getCalendar(@RequestParam String booth) {
		
		
		List<ExhibitionDTO> list = exhibitionDAO.getCalendar(booth);
		List<RentalPerformanceDTO> rentalList = new ArrayList<RentalPerformanceDTO>();
		
		for(int i = 0; i < list.size(); i++) {
			RentalPerformanceDTO rentalPerformanceDTO = new RentalPerformanceDTO();
			rentalPerformanceDTO.setTitle(list.get(i).getTitle());
			rentalPerformanceDTO.setYears(Integer.parseInt(list.get(i).getStartDate().substring(0, 4)));
			rentalPerformanceDTO.setDays(Integer.parseInt(list.get(i).getStartDate().substring(8, 10)));
			rentalPerformanceDTO.setEndDay(Integer.parseInt(list.get(i).getEndDate().substring(8, 10)));
			rentalPerformanceDTO.setMonths(Integer.parseInt(list.get(0).getStartDate().substring(5, 7)));
			rentalList.add(rentalPerformanceDTO);
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}*/
}
