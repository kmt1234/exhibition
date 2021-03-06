package main.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
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
	   ModelAndView mav = new ModelAndView();
	 
	   mav.addObject("display", "/main/I_body.jsp");
	   mav.setViewName("/main/index");
	   return mav;
   }
   /* 선택이미지 메인화면으로 전환~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/  
   @RequestMapping(value="I_body", method=RequestMethod.POST)
   public ModelAndView I_body(@RequestParam String[] check) {
      
      List<Integer> list = new ArrayList<Integer>();
      for(String seq : check) {
         list.add(Integer.parseInt(seq));
      }
      List<ImageboardDTO> dtoList = customerServiceDAO.getList(list);
      for(ImageboardDTO imageboardDTO : dtoList) {
         System.out.println(imageboardDTO.getImage1());
      }
      
      ModelAndView mav = new ModelAndView();
      
      mav.addObject("list",dtoList);
      mav.addObject("listLength",dtoList.size()-1);
      mav.setViewName("/main/index");
      return mav;
   }
}