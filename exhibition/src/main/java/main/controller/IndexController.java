package main.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import customerService.bean.EventboardDTO;
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

	/* 메인페이지 이동~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(@RequestParam(required = false, defaultValue = "1") String code, Model model) {
		model.addAttribute("code", code);
		model.addAttribute("display", "/main/I_body.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value = "I_body", method = RequestMethod.POST)
	public String I_body(@RequestParam String[] check ,Model model) {
		List<Integer> list = new ArrayList<Integer>();
		for (String seq : check) {
			list.add(Integer.parseInt(seq));
		}
		model.addAttribute("list",list);
		model.addAttribute("display", "/main/I_body.jsp");
		return "/main/index";
	}
	
	// 통합 검색 폼
	@RequestMapping(value = "index_SearchForm", method=RequestMethod.GET)
	public ModelAndView index_SearchForm(@RequestParam String index_keyword, Model model) {
		ModelAndView mav = new ModelAndView();
		model.addAttribute("index_keyword", index_keyword);
		mav.addObject("display", "/main/index_Search.jsp");
		mav.setViewName("/main/index_SearchForm");
		return mav;
	}
	
	// 메인 검색시 검색된 공지사항 리스트 불러옴
	@RequestMapping(value="index_Notice_Search", method=RequestMethod.POST)
	public ModelAndView index_NoticeSearch(@RequestParam(required = false) Map<String, String> map) {
		
		int totalA = mainDAO.getTotal_index_Notice_Search(map);
		List<MainDTO> list = mainDAO.index_Notice_Search(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	// 메인 검색시 검색된 자주묻는 질문 리스트 불러옴
	@RequestMapping(value="index_QnA_Search", method=RequestMethod.POST)
	public ModelAndView index_QnASearch(@RequestParam(required = false) Map<String, String> map) {
		
		int totalA = mainDAO.getTotal_index_QnA_Search(map);
		
		List<MainDTO> list = mainDAO.index_QnA_Search(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	// 메인 검색시 검색된 주요시설 연락처 리스트 불러옴
	@RequestMapping(value="index_contactList_Search", method=RequestMethod.POST)
	public ModelAndView index_contactListSearch(@RequestParam(required = false) Map<String, String> map) {
		
		int totalA = mainDAO.getTotal_index_contactList_Search(map);
		
		List<MainDTO> list = mainDAO.index_contactList_Search(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	// 메인 검색시 검색된 박람회 리스트 불러옴
	@RequestMapping(value="index_eventboard_Search", method=RequestMethod.POST)
	public ModelAndView index_eventboard_Search(@RequestParam(required = false) Map<String, String> map) {
		
		int totalA = mainDAO.getTotal_index_eventboard_Search(map);
		
		List<MainDTO> list = mainDAO.index_eventboard_Search(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		System.out.println(totalA);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	// 메인 검색시 검색된 연극 리스트 불러옴
	@RequestMapping(value="index_eventboard_play_Search", method=RequestMethod.POST)
	public ModelAndView index_eventboard_play_Search(@RequestParam(required = false) Map<String, String> map) {
		
		int totalA = mainDAO.getTotal_index_eventboard_play_Search(map);
		
		List<MainDTO> list = mainDAO.index_eventboard_play_Search(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		System.out.println(totalA);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
}