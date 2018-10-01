package main.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import customerService.bean.EventboardDTO;
import customerService.bean.ImageboardDTO;
import customerService.dao.CustomerServiceDAO;
import rental.bean.ConcertHallDTO;
import rental.dao.ConcertHallDAO;
import rental.dao.ExhibitionDAO;
import main.bean.MainDTO;
import main.dao.MainDAO;;


@RequestMapping(value = "main")
@Component
public class IndexController {
	@Autowired
	private CustomerServiceDAO customerServiceDAO;
	@Autowired
	private MainDAO mainDAO;
	@Autowired
	private List<ImageboardDTO> imageboardList;

	/* 메인페이지 이동~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(@RequestParam(required = false, defaultValue = "1") String code, Model model) {
		model.addAttribute("code_slide", code);
		model.addAttribute("display", "/main/I_body.jsp");
		List<EventboardDTO> list = mainDAO.index_exSlider();
		
		model.addAttribute("list",list);
		return "/main/index";
	}
	
	@RequestMapping(value = "I_body", method = RequestMethod.POST)
	public String I_body(@RequestParam String[] check ,Model model,String code) {
		System.out.println("체크이다 " + check.toString());
		
		List<Integer> list = new ArrayList<Integer>();
		for(String seq : check) {
			list.add(Integer.parseInt(seq));			
			System.out.println(list);
		}
		
		List<ImageboardDTO> list1= customerServiceDAO.getImageboardSlide(list);
		System.out.println(list1.get(0).getImage1());
		
		model.addAttribute("list1",list1);
		model.addAttribute("display", "/main/I_body_1.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value = "index_SearchForm", method=RequestMethod.GET)
	public ModelAndView index_SearchForm(@RequestParam String index_keyword, Model model) {
		ModelAndView mav = new ModelAndView();
		model.addAttribute("index_keyword", index_keyword);
		mav.addObject("display", "/main/index_Search.jsp");
		mav.setViewName("/main/index_SearchForm");
		return mav;
	}
	
	@RequestMapping(value="index_NoticeSearch", method=RequestMethod.POST)
	public ModelAndView index_NoticeSearch(@RequestParam(required = false) Map<String, String> map) {
		
		int totalA = mainDAO.getTotal_index_NoticeSearch(map);
		
		List<MainDTO> list = mainDAO.index_NoticeSearch(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav; 
	}

	
}