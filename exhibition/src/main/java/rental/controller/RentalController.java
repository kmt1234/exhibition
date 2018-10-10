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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import rental.bean.BusinessRoomDTO;
import rental.bean.ConcertHallDTO;
import rental.bean.ExhibitionDTO;
import rental.dao.BusinessRoomDAO;
import rental.dao.ConcertHallDAO;
import rental.dao.ExhibitionDAO;

@RequestMapping(value = "rental")
@Component
public class RentalController {

	@Autowired
	private ExhibitionDAO exhibitionDAO;
	@Autowired
	private BusinessRoomDAO businessRoomDAO;
	@Autowired
	private ConcertHallDAO concertHallDAO;

	// 렌탈페이지에 대한 정보를 입력하는 곳을 불러온다
	@RequestMapping(value = "R_rentalForm", method = RequestMethod.GET)
	public ModelAndView R_infoForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_info.jsp");
		mav.setViewName("/rental/R_rentalForm");

		return mav;
	}

	// 전시회&박람회 부스 위치에 대한 페이지를 불러온다.
	@RequestMapping(value = "R_exhibition", method = RequestMethod.GET)
	public ModelAndView R_exhibitionHoll() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_exhibition.jsp");
		mav.setViewName("/rental/R_rentalForm");

		return mav;
	}

	// 전시회&박람회 부스 위치에 대한 페이지를 불러온다.
	@RequestMapping(value = "R_businessRoom", method = RequestMethod.GET)
	public ModelAndView R_businessRoom() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_businessRoom.jsp");
		mav.setViewName("/rental/R_rentalForm");

		return mav;
	}

	// 공연장의 위치에 대한 페이지를 불러온다.
	@RequestMapping(value = "R_performance", method = RequestMethod.GET)
	public ModelAndView R_performance() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_concert.jsp");
		mav.setViewName("/rental/R_rentalForm");

		return mav;
	}

	// 콘서트홀 클릭하면 값을 가지고 예약하는 다음 페이지로 이동
	@RequestMapping(value = "R_concertHallDecision", method = RequestMethod.GET)
	public ModelAndView R_concertHallDecision(@RequestParam String hallName, Model model, ModelMap modelMap) {
		
		int rate = concertHallDAO.getRateConcertHall(hallName);
		int width = 0;
		
		if (hallName.equals("P_Room1") || hallName.equals("P_Room2")) {
			width = 100;
		} else if (hallName.equals("P_Room3") || hallName.equals("P_Room4")) {
			width = 120;
		}
		
		Calendar cal = Calendar.getInstance();
		cal.add(cal.MONTH, 1);
		
		Date date = new Date(cal.getTimeInMillis());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

		model.addAttribute("rate", rate);
		model.addAttribute("width", width);
		model.addAttribute("hallName", hallName);
		model.addAttribute("date", sdf.format(date));

		List<ConcertHallDTO> list = concertHallDAO.getCalendar(hallName);
		for (ConcertHallDTO data : list) {
			data.setStartDate(data.getStartDate().substring(0, 10));
			data.setEndDate(data.getEndDate().substring(0, 10));
			data.setDays(getDiffDays(data.getStartDate().substring(0, 10).replaceAll("-", ""),
					data.getEndDate().substring(0, 10).replaceAll("-", "")));
			String[] strDays = data.getDays();
			for (int i = 0; i < data.getDays().length; i++) {
				StringBuffer sb = new StringBuffer(strDays[i]);
				sb.insert(4, "-");
				sb.insert(7, "-");
				strDays[i] = sb.toString();
			}
			data.setDays(strDays);
			data.setDaysSize(strDays.length);
		}

		modelMap.addAttribute("listView", list);

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_concertHallDecision.jsp");
		mav.setViewName("/rental/R_rentalForm");

		return mav;
	}

	// 진시회&박람회 부스 클릭하면 값을 가지고 다음 페이지로 이동
	@RequestMapping(value = "R_exhibitionHollDecision", method = RequestMethod.GET)
	public ModelAndView R_exhibitionHollDecision(@RequestParam String booth, Model model, ModelMap modelMap) {
		/*double rate = 0;
		if (booth.equals("Booth1") || booth.equals("Booth2") || booth.equals("Booth3") || booth.equals("Booth4")
				|| booth.equals("Booth7") || booth.equals("Booth8") || booth.equals("Booth9")
				|| booth.equals("Booth10") || booth.equals("Booth11") || booth.equals("Booth12") || booth.equals("Booth13") || booth.equals("Booth14")) {
			rate = 2350 * 1.0 * 1.0 * 3 2.592 ;
		} else if (booth.equals("Booth5") || booth.equals("Booth6")) {
			rate = 2350 * 1.0 * 1.2 * 5 6.343 ;
		}*/
		
		int rate = exhibitionDAO.getRateExhibition(booth);
		int width = 0;
		
		if (booth.equals("Booth1") || booth.equals("Booth2") || booth.equals("Booth3") || booth.equals("Booth4")
				|| booth.equals("Booth7") || booth.equals("Booth8") || booth.equals("Booth9")
				|| booth.equals("Booth10") || booth.equals("Booth11") || booth.equals("Booth5") || booth.equals("Booth6")) {
			width = 100;
		} else if (booth.equals("Booth12") || booth.equals("Booth13") || booth.equals("Booth14")) {
			width = 120;
		}
		

		Date date = new Date();
		
		Calendar cal = Calendar.getInstance();

        cal.setTime(date);

        cal.add(Calendar.DATE, 1);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

		model.addAttribute("rate", rate);
		model.addAttribute("width", width);
		model.addAttribute("booth", booth);
		model.addAttribute("date", sdf.format(cal.getTime()));

		List<ExhibitionDTO> list = exhibitionDAO.getCalendar(booth);
		for (ExhibitionDTO data : list) {
			data.setStartDate(data.getStartDate().substring(0, 10));
			data.setEndDate(data.getEndDate().substring(0, 10));
			data.setDays(getDiffDays(data.getStartDate().substring(0, 10).replaceAll("-", ""),
					data.getEndDate().substring(0, 10).replaceAll("-", "")));
			String[] strDays = data.getDays();
			for (int i = 0; i < data.getDays().length; i++) {
				StringBuffer sb = new StringBuffer(strDays[i]);
				sb.insert(4, "-");
				sb.insert(7, "-");
				strDays[i] = sb.toString();
			}
			data.setDays(strDays);
			data.setDaysSize(strDays.length);
		}

		modelMap.addAttribute("listView", list);

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_exhibitionHollDecision.jsp");
		mav.setViewName("/rental/R_rentalForm");

		return mav;
	}

	// 비지니스룸 예약하는 페이지로 이동
	@RequestMapping(value = "R_businessRoomDecision", method = RequestMethod.GET)
	public ModelAndView businessRoomDecision(@RequestParam String businessRoom, Model model, ModelMap modelMap) {
		
		int rate = businessRoomDAO.getRateBusinessRoom(businessRoom);
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
		Calendar cal = Calendar.getInstance();

        cal.setTime(date);

        cal.add(Calendar.DATE, 1);

		model.addAttribute("businessRoom", businessRoom);
		model.addAttribute("rate", rate);
		model.addAttribute("date", sdf.format(cal.getTime()));

		List<BusinessRoomDTO> list = businessRoomDAO.getCalendar(businessRoom);

		for (BusinessRoomDTO data : list) {
			data.setStartDate(data.getStartDate().substring(0, 10));
			if (data.getFirst().equals("Y")) {
				data.setTitle("09 ~ 12");
			} else if (data.getSecond().equals("Y")) {
				data.setTitle("12 ~ 15");
			} else if (data.getThird().equals("Y")) {
				data.setTitle("15 ~ 18");
			} else if (data.getFourth().equals("Y")) {
				data.setTitle("18 ~ 21");
			}
		}

		modelMap.addAttribute("listView", list);

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_businessRoomDecision.jsp");
		mav.setViewName("/rental/R_rentalForm");

		return mav;
	}

	// 예약가능한 booth 날짜 확인하기
	@RequestMapping(value = "searchRentDay", method = RequestMethod.POST)
	public @ResponseBody String searchRentDay(@RequestParam String booth, @RequestParam String startDate,
			@RequestParam String endDate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("boothName", booth);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		String result = exhibitionDAO.searchRentDay(map);

		return result;
	}
	
	// 예약가능한 concertHall 날짜 확인하기
	@RequestMapping(value = "searchConcertHallRentDay", method = RequestMethod.POST)
	public @ResponseBody String searchConcertHallRentDay(@RequestParam String hallName, @RequestParam String startDate,
			@RequestParam String endDate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("hallName", hallName);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		String result = concertHallDAO.searchConcertHallRentDay(map);

		return result;
	}

	// 특정 날짜 비지니스룸 예약현황 확인
	@RequestMapping(value = "searchBusinessRoom", method = RequestMethod.POST)
	public ModelAndView searchBusinessRoom(@RequestParam String roomName, @RequestParam String startDate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("roomName", roomName);
		map.put("startDate", startDate);

		List<BusinessRoomDTO> list = businessRoomDAO.getTimeListBusinessRoom(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	// 비지니스룸 예약
	@RequestMapping(value = "rentalBusinessRoom", method = RequestMethod.POST)
	public ModelAndView rentalBusinessRoom(@ModelAttribute BusinessRoomDTO businessRoomDTO, @RequestParam int rate) {
		businessRoomDTO.setTotalRent(rate);
		
		for (int i = 0; i < businessRoomDTO.getCheckRow().length; i++) {
			businessRoomDTO.setTime(businessRoomDTO.getCheckRow()[i]);
		}

		businessRoomDAO.rentalBusinessRoom(businessRoomDTO);

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_businessRoom.jsp");
		mav.setViewName("/rental/R_rentalForm");
		return mav;
	}

	// 부스 예약
	@RequestMapping(value = "reservationHoll", method = RequestMethod.POST)
	public ModelAndView reservationHoll(@RequestParam String booth, @RequestParam String startDate,
			@RequestParam String endDate, @RequestParam String C_email, @RequestParam String C_license,
			@RequestParam String C_tel, @RequestParam String title, @RequestParam int totalRent) {
		ExhibitionDTO exhibitionDTO = new ExhibitionDTO();
		exhibitionDTO.setBoothName(booth);
		exhibitionDTO.setC_email(C_email);
		exhibitionDTO.setC_license(C_license);
		exhibitionDTO.setC_tel(C_tel);
		exhibitionDTO.setCode("2");
		exhibitionDTO.setEndDate(endDate);
		exhibitionDTO.setStartDate(startDate);
		exhibitionDTO.setTotalRent(totalRent);
		exhibitionDTO.setTitle(title);

		exhibitionDAO.reservationHoll(exhibitionDTO);

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_exhibition.jsp");
		mav.setViewName("/rental/R_rentalForm");
		return mav;
	}
	
	// 공연장 예약
	@RequestMapping(value = "reservationConcertHall", method = RequestMethod.POST)
	public ModelAndView reservationConcertHall(@ModelAttribute ConcertHallDTO concertHallDTO) {
		

		concertHallDAO.reservationConcertHall(concertHallDTO);

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_concert.jsp");
		mav.setViewName("/rental/R_rentalForm");
		return mav;
	}

	/**
	 * 시작일부터 종료일까지 사이의 날짜를 배열에 담아 리턴 ( 시작일과 종료일을 모두 포함한다 )
	 * 
	 * @param fromDate yyyyMMdd 형식의 시작일
	 * @param toDate   yyyyMMdd 형식의 종료일
	 * @return yyyyMMdd 형식의 날짜가 담긴 배열
	 */
	
	//부스 평당 가격 수정
	@RequestMapping(value = "modifyRateExhibition", method = RequestMethod.POST)
	public ModelAndView modifyRateExhibition(@RequestParam String boothNameSel, @RequestParam int boothRate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("booth", boothNameSel);
		map.put("rate", String.valueOf(boothRate));
		
		exhibitionDAO.updateExhibitionRate(map);
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_exhibition.jsp");
		mav.setViewName("/rental/R_rentalForm");
	
		return mav;
	}
	
	//콘서트홀 평당 가격 수정
	@RequestMapping(value = "modifyRateConcertHall", method = RequestMethod.POST)
	public ModelAndView modifyRateConcertHall(@RequestParam String hallNameSel, @RequestParam int hallRate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("hallName", hallNameSel);
		map.put("rate", String.valueOf(hallRate));
		
		concertHallDAO.updateConcertHallRate(map);
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_concert.jsp");
		mav.setViewName("/rental/R_rentalForm");
	
		return mav;
	}
	
	//비지니스룸 방 가격 수정
	@RequestMapping(value = "modifyRateBusinessRoom", method = RequestMethod.POST)
	public ModelAndView modifyRateBusinessRoom(@RequestParam String roomNameSel, @RequestParam int roomRate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("roomName", roomNameSel);
		map.put("rate", String.valueOf(roomRate));
		
		businessRoomDAO.updateBusinessRoomRate(map);
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/rental/R_businessRoom.jsp");
		mav.setViewName("/rental/R_rentalForm");
	
		return mav;
	}

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
	 * @param fromDate yyyyMMdd 형식의 시작일
	 * @param toDate   yyyyMMdd 형식의 종료일
	 * @return 두날짜 사이의 일수
	 */
	public static int getDiffDayCount(String fromDate, String toDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		try {
			return (int) ((sdf.parse(toDate).getTime() - sdf.parse(fromDate).getTime()) / 1000 / 60 / 60 / 24);
		} catch (Exception e) {
			return 0;
		}
	}

	/*
	 * @RequestMapping(value="getCalendar", method=RequestMethod.POST) public
	 * ModelAndView getCalendar(@RequestParam String booth) {
	 * 
	 * 
	 * List<ExhibitionDTO> list = exhibitionDAO.getCalendar(booth);
	 * List<RentalPerformanceDTO> rentalList = new
	 * ArrayList<RentalPerformanceDTO>();
	 * 
	 * for(int i = 0; i < list.size(); i++) { RentalPerformanceDTO
	 * rentalPerformanceDTO = new RentalPerformanceDTO();
	 * rentalPerformanceDTO.setTitle(list.get(i).getTitle());
	 * rentalPerformanceDTO.setYears(Integer.parseInt(list.get(i).getStartDate().
	 * substring(0, 4)));
	 * rentalPerformanceDTO.setDays(Integer.parseInt(list.get(i).getStartDate().
	 * substring(8, 10)));
	 * rentalPerformanceDTO.setEndDay(Integer.parseInt(list.get(i).getEndDate().
	 * substring(8, 10)));
	 * rentalPerformanceDTO.setMonths(Integer.parseInt(list.get(0).getStartDate().
	 * substring(5, 7))); rentalList.add(rentalPerformanceDTO); }
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * mav.addObject("list", list); mav.setViewName("jsonView"); return mav; }
	 */
}
