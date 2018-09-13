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
	/*//교통정보
	@RequestMapping(value="T_trafficForm", method=RequestMethod.GET)
	public ModelAndView T_infoForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display","/traffic/T_allForm.jsp");
		mav.setViewName("/traffic/T_trafficForm");
		
		return mav;
	}*/
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
