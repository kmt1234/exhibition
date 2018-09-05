package traffic.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="traffic")
@Component
public class TrafficController {
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
}
