package traffic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import customerService.bean.HotelboardDTO;
import customerService.bean.ImageboardPaging;
import customerService.dao.CustomerServiceDAO;

@RequestMapping(value="traffic")
@Component
public class TrafficController {
	@Autowired
	private CustomerServiceDAO customerServiceDAO;
	@Autowired
	private ImageboardPaging imageboardPaging;
	//교통정보
	@RequestMapping(value="T_trafficForm", method=RequestMethod.GET)
	public ModelAndView T_infoForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display","/traffic/T_allForm.jsp");
		mav.setViewName("/traffic/T_trafficForm");
		
		return mav;
	}
	@RequestMapping(value="T_allForm", method=RequestMethod.GET)
	public String T_allForm() {
		return "/traffic/T_allForm";
	}
	@RequestMapping(value="T_parkingAllForm", method=RequestMethod.GET)
	public String T_parkingAllForm() {
		return "/traffic/T_parkingAllForm";
	}
	
	//사용자가 보는 호텔리스트
	@RequestMapping(value="T_hotelList", method=RequestMethod.GET)
	public ModelAndView T_hotelList(@RequestParam(required=false , defaultValue="1") String pg) {	
		int endNum = Integer.parseInt(pg)*16;
		int startNum = endNum-15;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		int totalA = customerServiceDAO.getHotelboardTotalA();

		imageboardPaging.setCurrentPage(Integer.parseInt(pg));
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(16);
		imageboardPaging.setTotalA(totalA);

		imageboardPaging.hotelMakePagingHTML();
		
		List<HotelboardDTO> list = customerServiceDAO.hotelList(map);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pg", pg);
		mav.addObject("imageboardPaging",imageboardPaging);
		mav.addObject("list", list);
		mav.addObject("list_size",list.size()+"");
		mav.setViewName("/traffic/T_hotelList");
		return mav;
	}
}
