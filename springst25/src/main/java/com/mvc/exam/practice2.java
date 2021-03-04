package com.mvc.exam;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class practice2 {

	@RequestMapping(value="/practice.do", method = RequestMethod.GET)
	public ModelAndView practice(Shopping shopping, ModelAndView modelAndView) throws Exception {
	
		String date = new SimpleDateFormat("yy년 MM월 dd일 HH:mm:ss").format(shopping.getDate());

		System.out.println(shopping.getNumber());
		System.out.println(shopping.getName());
		System.out.println(shopping.getCode());
		System.out.println(shopping.getPrice());
		System.out.println(shopping.getQuantity());
		System.out.println(date);
		
		modelAndView.addObject("date", date);
		
		modelAndView.setViewName("practice2");
		return modelAndView;
	}
}
