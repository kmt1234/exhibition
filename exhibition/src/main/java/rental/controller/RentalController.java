package rental.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import company.bean.CompanyDTO;
import performance.bean.PerformanceDTO;
import rental.bean.ExhibitionDTO;
import rental.bean.RentalPerformanceDTO;
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
	public String R_exhibitionHollDecision(@RequestParam String booth, Model model) {
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
		
		
		return "/rental/R_exhibitionHollDecision";
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
	
	@RequestMapping(value="getCalendar", method=RequestMethod.POST)
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
		/*List<PerformanceDTO> list = performanceDAO.getPerformance();*/
		
		mav.addObject("list", rentalList);
		mav.setViewName("jsonView");
		return mav;
	}
}
