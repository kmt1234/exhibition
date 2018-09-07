package main.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import customerService.bean.ImageboardDTO;
import customerService.dao.CustomerServiceDAO;

@RequestMapping(value="main")
@Component
public class IndexController {
   @Autowired
   private CustomerServiceDAO customerServiceDAO;
   
   @RequestMapping(value="index", method=RequestMethod.GET)
   public String index() {
      return "/main/index";
   }
   
   @RequestMapping(value="I_body", method=RequestMethod.POST)
   public String I_body(@RequestParam String[] check,
                  Model model) {
      
      List<Integer> list = new ArrayList<Integer>();
      for(String seq : check) {
         list.add(Integer.parseInt(seq));
      }
      List<ImageboardDTO> dtoList = customerServiceDAO.getList(list);
      for(ImageboardDTO imageboardDTO : dtoList) {
         System.out.println(imageboardDTO.getImage1());
      }
      model.addAttribute("list",dtoList);
      model.addAttribute("listLength",dtoList.size()-1);
      
      
      return "/main/index";
   }
}