package main.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import customerService.dao.CustomerServiceDAO;

@RequestMapping(value = "main")
@Component
public class IndexController {
	@Autowired
	private CustomerServiceDAO customerServiceDAO;

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
}