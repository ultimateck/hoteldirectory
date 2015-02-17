package com.hoteldirectory.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hoteldirectory.connectivity.CityDAO;
import com.hoteldirectory.connectivity.HotelDAO;
import com.hoteldirectory.model.City;
import com.hoteldirectory.model.Hotel;


@Controller
public class HotelDirectoryController {
	String message = "Welcome to Spring MVC!";
	
	@Autowired
    private HotelDAO hotelConn;
	
	@Autowired
    private CityDAO cityConn;
	 
	@RequestMapping("/hello")
	public ModelAndView showMessage(
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {
		System.out.println("in controller: hello");
 
		ModelAndView mv = new ModelAndView("helloworld");
		mv.addObject("message", message);
		mv.addObject("name", name);
		return mv;
	}
	
	@RequestMapping("/home")
	public ModelAndView showHome(ModelAndView mv ) {
		System.out.println("in controller: hello");
 
		mv = new ModelAndView("home");
		return mv;
	}
	
	@RequestMapping(value="/list")
	public ModelAndView hotelList(ModelAndView model) throws IOException{
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
	
	@RequestMapping(value="/saveHotel", method ={ RequestMethod.GET, RequestMethod.POST })
	public ModelAndView saveHotel(ModelAndView model, @ModelAttribute Hotel hotel, 
			@RequestParam(value = "type", required = false, defaultValue = "1") String type) throws IOException{
		
		if(!type.equals("1")){
			try{
				if(hotel.getName()!= "" && hotel.getAddress() != ""){
					hotelConn.saveOrUpdate(hotel);
					model.addObject("msg", "Save Success");
				}
				else { model.addObject("error", "Please Fill All Required Fields !");}
				System.out.println("in controller: saveHotel: Type=0");
			}catch(Exception ex){
				model.addObject("error","Saving Hotel Details failed !");
				
				System.out.println(ex.getMessage());
			}
		} else {
			
		    System.out.println("in controller: saveHotel: Type=1");
		}
		List<City> cityList = cityConn.list();
	    model.addObject("cityList", cityList);
		model.setViewName("hotelform");
	    return model;
	}

}
