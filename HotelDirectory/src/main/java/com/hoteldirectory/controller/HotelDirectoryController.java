package com.hoteldirectory.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hoteldirectory.connectivity.HotelDAO;
import com.hoteldirectory.model.Hotel;

@Controller
public class HotelDirectoryController {
	String message = "Welcome to Spring MVC!";
	
	@Autowired
    private HotelDAO hotelConn;
	 
	@RequestMapping("/hello")
	public ModelAndView showMessage(
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {
		System.out.println("in controller: hello");
 
		ModelAndView mv = new ModelAndView("helloworld");
		mv.addObject("message", message);
		mv.addObject("name", name);
		return mv;
	}
	
	@RequestMapping(value="/list")
	public ModelAndView listContact(ModelAndView model) throws IOException{
		System.out.println("in controller: list");
		try{
	    List<Hotel> hotelList = hotelConn.list();
	    model.addObject("hotelList", hotelList);
	    model.setViewName("list");
		}catch(Exception ex){
			model.addObject("error","Connection to database failed !");
			model.setViewName("list");
			System.out.println(ex.getMessage());
		}
	 
	    return model;
	}

}
