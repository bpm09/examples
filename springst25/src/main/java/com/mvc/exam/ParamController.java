package com.mvc.exam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ParamController {

	@RequestMapping(value="/param1.do", method = RequestMethod.GET)
	public ModelAndView param1(@RequestParam(value = "name", required=false, defaultValue="empty") String name, 
								@RequestParam(value="age", defaultValue="0") int age, ModelAndView modelAndView) throws Exception {
		
		System.out.println("name : " + name + " age : " + age);
		
		modelAndView.setViewName("param1Link");
	
		return modelAndView;
	}
	
	@RequestMapping(value="/param2.do", method = RequestMethod.GET)
	public ModelAndView param2(Goods goods, ModelAndView modelAndView) throws Exception {
		
		System.out.println("code : " + goods.getCode());
		System.out.println("name : " + goods.getName());
		System.out.println("price : " + goods.getPrice());
		System.out.println("color : " + goods.getColor());
		
		
		modelAndView.setViewName("form01");
		return modelAndView;
	}


}