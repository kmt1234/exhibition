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
import rental.bean.ConcertHallDTO;
import rental.dao.ConcertHallDAO;
import rental.dao.ExhibitionDAO;
import main.bean.MainDTO;
import main.bean.MainPaging;
import main.dao.MainDAO;;


@RequestMapping(value = "main")
@Component
public class IndexController {
	
	@Autowired
	private MainDAO mainDAO;
	@Autowired
	private MainPaging mainPaging;

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
	
	// 
	@RequestMapping(value = "index_Search", method=RequestMethod.GET)
	public ModelAndView index_Search(@RequestParam String index_keyword, Model model) {
		ModelAndView mav = new ModelAndView();
		model.addAttribute("index_keyword", index_keyword);
		
		mav.addObject("display", "/main/index_Search.jsp");
		mav.setViewName("/main/index_SearchForm");
		return mav;
	}
	
	// 메인 검색시 검색된 공지사항 리스트 불러옴
	@RequestMapping(value="index_notice_Search", method=RequestMethod.POST)
	public ModelAndView index_notice_Search(@RequestParam Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 3;
		int startNum = endNum - 2;
		
		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");

		List<MainDTO> list = mainDAO.index_notice_Search(map);
		
		int totalA = mainDAO.getTotal_index_notice_Search(map);
		
		mainPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		mainPaging.setPageBlock(3);
		mainPaging.setPageSize(3);
		mainPaging.setTotalA(totalA);
		mainPaging.index_searchPagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		mav.addObject("list", list);
		mav.addObject("mainPaging", mainPaging);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	@RequestMapping(value="index_notice_Plus", method=RequestMethod.GET)
	public ModelAndView index_notice_Plus(@RequestParam(required = false, defaultValue = "1") int pg, @RequestParam String index_keyword, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("index_keyword", index_keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/index_notice_Plus.jsp");
		mav.setViewName("/main/index_SearchForm");
		return mav;
	}
	
	// 메인 검색후  공지사항 더보기 버튼 클릭시 리스트 불러옴
	@RequestMapping(value="index_notice_SearchPlus", method=RequestMethod.GET)
	public ModelAndView index_notice_SearchPlus(@RequestParam(required = false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 10;
		int startNum = endNum - 9;
		
		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");

		
		List<MainDTO> list = mainDAO.index_notice_Search(map);
		
		int totalA = mainDAO.getTotal_index_notice_Search(map);
		
		mainPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		mainPaging.setPageBlock(10);
		mainPaging.setPageSize(10);
		mainPaging.setTotalA(totalA);
		mainPaging.index_notice_searchPlusPagingHTML(map.get("index_keyword"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		mav.addObject("list", list);
		mav.addObject("mainPaging", mainPaging);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	// 메인 검색시 검색된 자주묻는 질문 리스트 불러옴
	@RequestMapping(value="index_QnA_Search", method=RequestMethod.POST)
	public ModelAndView index_QnA_Search(@RequestParam(required = false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 3;
		int startNum = endNum - 2;
		
		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");
		
		List<MainDTO> list = mainDAO.index_QnA_Search(map);
		
		int totalA = mainDAO.getTotal_index_QnA_Search(map);
		
		mainPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		mainPaging.setPageBlock(3);
		mainPaging.setPageSize(3);
		mainPaging.setTotalA(totalA);
		mainPaging.index_searchPagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		mav.addObject("list", list);
		mav.addObject("mainPaging", mainPaging);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	@RequestMapping(value="index_QnA_Plus", method=RequestMethod.GET)
	public ModelAndView index_QnA_Plus(@RequestParam(required = false, defaultValue = "1") int pg, @RequestParam String index_keyword, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("index_keyword", index_keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/index_QnA_Plus.jsp");
		mav.setViewName("/main/index_SearchForm");
		return mav;
	}
	
	// 메인 검색후  자주묻는 질문 더보기 버튼 클릭시 리스트 불러옴
	@RequestMapping(value="index_QnA_SearchPlus", method=RequestMethod.POST)
	public ModelAndView index_QnA_SearchPlus(@RequestParam(required = false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 10;
		int startNum = endNum - 9;
		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");

		List<MainDTO> list = mainDAO.index_QnA_Search(map);
		
		int totalA = mainDAO.getTotal_index_QnA_Search(map);
		
		mainPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		mainPaging.setPageBlock(10);
		mainPaging.setPageSize(10);
		mainPaging.setTotalA(totalA);
		mainPaging.index_QnA_searchPlusPagingHTML(map.get("index_keyword"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		mav.addObject("list", list);
		mav.addObject("mainPaging", mainPaging);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	
	
	// 메인 검색시 검색된 주요시설 연락처 리스트 불러옴
	@RequestMapping(value="index_contactList_Search", method=RequestMethod.POST)
	public ModelAndView index_contactList_Search(@RequestParam(required = false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 3;
		int startNum = endNum - 2;
		
		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");
		
		List<MainDTO> list = mainDAO.index_contactList_Search(map);
		
		int totalA = mainDAO.getTotal_index_contactList_Search(map);
		
		mainPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		mainPaging.setPageBlock(3);
		mainPaging.setPageSize(3);
		mainPaging.setTotalA(totalA);
		mainPaging.index_searchPagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		mav.addObject("list", list);
		mav.addObject("mainPaging", mainPaging);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	@RequestMapping(value="index_contactList_Plus", method=RequestMethod.GET)
	public ModelAndView index_contactList_Plus(@RequestParam(required = false, defaultValue = "1") int pg, @RequestParam String index_keyword, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("index_keyword", index_keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/index_contactList_Plus.jsp");
		mav.setViewName("/main/index_SearchForm");
		return mav;
	}
	
	// 메인 검색후  주요시설 연락처 더보기 버튼 클릭시 리스트 불러옴
	@RequestMapping(value="index_contactList_SearchPlus", method=RequestMethod.GET)
	public ModelAndView index_contactList_SearchPlus(@RequestParam(required = false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 10;
		int startNum = endNum - 9;
		
		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");
		
		List<MainDTO> list = mainDAO.index_contactList_Search(map);
		
		int totalA = mainDAO.getTotal_index_contactList_Search(map);
		
		mainPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		mainPaging.setPageBlock(10);
		mainPaging.setPageSize(10);
		mainPaging.setTotalA(totalA);
		mainPaging.index_contactList_searchPlusPagingHTML(map.get("index_keyword"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		mav.addObject("list", list);
		mav.addObject("mainPaging", mainPaging);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	// 메인 검색시 검색된 박람회 리스트 불러옴
	@RequestMapping(value="index_eventboard_Search", method=RequestMethod.POST)
	public ModelAndView index_eventboard_Search(@RequestParam(required = false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 3;
		int startNum = endNum - 2;
		
		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");
		
		List<MainDTO> list = mainDAO.index_eventboard_Search(map);
		
		int totalA = mainDAO.getTotal_index_eventboard_Search(map);
		
		
		mainPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		mainPaging.setPageBlock(3);
		mainPaging.setPageSize(3);
		mainPaging.setTotalA(totalA);
		mainPaging.index_searchPagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		mav.addObject("list", list);
		mav.addObject("mainPaging", mainPaging);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	// 메인 검색후 박람회 더보기 버튼 클릭시 리스트 폼
	@RequestMapping(value="index_eventboard_Plus", method=RequestMethod.GET)
	public ModelAndView index_eventboard_Plus(@RequestParam(required = false, defaultValue = "1") int pg, @RequestParam String index_keyword, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("index_keyword", index_keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/index_eventboard_Plus.jsp");
		mav.setViewName("/main/index_SearchForm");
		return mav;
	}
	
	// 메인 검색후  박람회 더보기 버튼 클릭시 리스트 불러옴
	@RequestMapping(value="index_eventboard_SearchPlus", method=RequestMethod.GET)
	public ModelAndView index_eventboard_SearchPlus(@RequestParam(required = false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 10;
		int startNum = endNum - 9;
		
		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");

		
		List<MainDTO> list = mainDAO.index_eventboard_Search(map);
		
		int totalA = mainDAO.getTotal_index_eventboard_Search(map);
		
		mainPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		mainPaging.setPageBlock(10);
		mainPaging.setPageSize(10);
		mainPaging.setTotalA(totalA);
		mainPaging.index_eventboard_searchPlusPagingHTML(map.get("index_keyword"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		mav.addObject("list", list);
		mav.addObject("mainPaging", mainPaging);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	// 메인 검색시 검색된 연극 리스트 불러옴
	@RequestMapping(value="index_eventboard_play_Search", method=RequestMethod.POST)
	public ModelAndView index_eventboard_play_Search(@RequestParam(required = false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 3;
		int startNum = endNum - 2;
		
		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");
		
		int totalA = mainDAO.getTotal_index_eventboard_play_Search(map);
		
		List<MainDTO> list = mainDAO.index_eventboard_play_Search(map);
		
		mainPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		mainPaging.setPageBlock(3);
		mainPaging.setPageSize(3);
		mainPaging.setTotalA(totalA);
		mainPaging.index_searchPagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		mav.addObject("list", list);
		mav.addObject("mainPaging", mainPaging);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	// 메인 검색후 검색된 연극 리스트 불러옴
	@RequestMapping(value="index_eventboard_play_Plus", method=RequestMethod.GET)
	public ModelAndView index_eventboard_play_Plus(@RequestParam(required = false, defaultValue = "1") int pg, @RequestParam String index_keyword, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("index_keyword", index_keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/index_eventboard_play_Plus.jsp");
		mav.setViewName("/main/index_SearchForm");
		return mav;
	}
	
	// 메인 검색후  연극 더보기 버튼 클릭시 리스트 불러옴
	@RequestMapping(value="index_eventboard_play_SearchPlus", method=RequestMethod.GET)
	public ModelAndView index_eventboard_play_SearchPlus(@RequestParam(required = false) Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 10;
		int startNum = endNum - 9;
		
		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");
		
		int totalA = mainDAO.getTotal_index_eventboard_play_Search(map);
		
		List<MainDTO> list = mainDAO.index_eventboard_play_Search(map);
		
		mainPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		mainPaging.setPageBlock(10);
		mainPaging.setPageSize(10);
		mainPaging.setTotalA(totalA);
		mainPaging.index_eventboard_play_searchPlusPagingHTML(map.get("index_keyword"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalA", totalA);
		mav.addObject("list", list);
		mav.addObject("mainPaging", mainPaging);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	// 메인 검색시 검색된 숙박 리스트 불러옴
		@RequestMapping(value="index_hotel_list_Search", method=RequestMethod.POST)
		public ModelAndView index_hotel_list_Search(@RequestParam(required = false) Map<String, String> map) {
			int endNum = Integer.parseInt(map.get("pg")) * 3;
			int startNum = endNum - 2;
			
			map.put("startNum", startNum + "");
			map.put("endNum", endNum + "");
			
			int totalA = mainDAO.getTotal_index_hotel_list_Search(map);
			
			List<MainDTO> list = mainDAO.index_hotel_list_Search(map);
			
			mainPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
			mainPaging.setPageBlock(3);
			mainPaging.setPageSize(3);
			mainPaging.setTotalA(totalA);
			mainPaging.index_searchPagingHTML();
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("totalA", totalA);
			mav.addObject("list", list);
			mav.addObject("mainPaging", mainPaging);
			mav.setViewName("jsonView");
			
			return mav; 
		}
		
		//
		@RequestMapping(value="index_hotel_list_Plus", method=RequestMethod.GET)
		public ModelAndView index_hotel_list_Plus(@RequestParam(required = false, defaultValue = "1") int pg, @RequestParam String index_keyword, Model model) {
			model.addAttribute("pg", pg);
			model.addAttribute("index_keyword", index_keyword);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("display", "/main/index_hotel_list_Plus.jsp");
			mav.setViewName("/main/index_SearchForm");
			return mav;
		}
		// 메인 검색후  숙박 더보기 버튼 클릭시 리스트 불러옴
		@RequestMapping(value="index_hotel_list_SearchPlus", method=RequestMethod.GET)
		public ModelAndView index_hotel_list_SearchPlus(@RequestParam(required = false) Map<String, String> map) {
			int endNum = Integer.parseInt(map.get("pg")) * 10;
			int startNum = endNum - 9;
			
			map.put("startNum", startNum + "");
			map.put("endNum", endNum + "");
			
			int totalA = mainDAO.getTotal_index_hotel_list_Search(map);
			
			List<MainDTO> list = mainDAO.index_hotel_list_Search(map);
			
			mainPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
			mainPaging.setPageBlock(10);
			mainPaging.setPageSize(10);
			mainPaging.setTotalA(totalA);
			mainPaging.index_hotel_list_searchPlusPagingHTML(map.get("index_keyword"));
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("totalA", totalA);
			mav.addObject("list", list);
			mav.addObject("mainPaging", mainPaging);
			mav.setViewName("jsonView");
			
			return mav; 
		}
}