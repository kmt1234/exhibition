package traffic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import customerService.bean.HotelboardDTO;
import customerService.dao.CustomerServiceDAO;

@RequestMapping(value="traffic")
@Component
public class TrafficController {
	@Autowired
	private CustomerServiceDAO customerServiceDAO;
	//교통정보
	@RequestMapping(value="T_infoForm", method=RequestMethod.GET)
	public String T_infoForm() {
		return "/traffic/T_infoForm";
	}
	//자동차
	@RequestMapping(value="T_carForm", method=RequestMethod.GET)
	public String T_car() {
		return "/traffic/T_carForm";
	}
	//버스
	@RequestMapping(value="T_busForm", method=RequestMethod.GET)
	public String T_bus() {
		return "/traffic/T_busForm";
	}
	//지하철
	@RequestMapping(value="T_subwayForm", method=RequestMethod.GET)
	public String T_subway() {
		return "/traffic/T_subwayForm";
	}
	@RequestMapping(value="T_allForm", method=RequestMethod.GET)
	public String T_allForm() {
		return "/traffic/T_allForm";
	}
	@RequestMapping(value="T_parkingAllForm", method=RequestMethod.GET)
	public String T_parkingAllForm() {
		return "/traffic/T_parkingAllForm";
	}
	
	@RequestMapping(value="T_hotelList", method=RequestMethod.GET)
	public ModelAndView T_hotelList() {	
		List<HotelboardDTO> list = customerServiceDAO.hotelList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/traffic/T_hotelList");
		return mav;
	}
}
