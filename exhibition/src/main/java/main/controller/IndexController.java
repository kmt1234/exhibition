package main.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import customerService.bean.ImageboardDTO;
import customerService.dao.CustomerServiceDAO;

@RequestMapping(value="main")
@Component
public class IndexController {
   @Autowired
   private CustomerServiceDAO customerServiceDAO;
   
   /* 메인페이지 이동~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
   @RequestMapping(value="index", method=RequestMethod.GET)
   public ModelAndView index() {
	   return new ModelAndView("redirect:/customerService/C_notice.do");
   }
   @RequestMapping(value="I_body", method=RequestMethod.GET)
   public ModelAndView I_body() {
	   ModelAndView mav = new ModelAndView();
	   
	   return mav;
	   
   }
}