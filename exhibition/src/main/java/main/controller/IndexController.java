package main.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="main")
@Component
public class IndexController {
	@RequestMapping(value="index", method=RequestMethod.GET)
	public String index() {
		return "/main/index";
	}
}
