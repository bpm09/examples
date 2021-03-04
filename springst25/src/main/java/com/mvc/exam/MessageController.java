package com.mvc.exam;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController {

	private static final Logger Logger = LoggerFactory.getLogger(MessageController.class);

	@RequestMapping(value ="/message.do", method = RequestMethod.GET)
	public ModelAndView message(ModelAndView modelAndView) {
		Logger.debug("Message 실행");
		
		modelAndView.addObject("data1", "홍길동");
		modelAndView.addObject("data2", 10);
		
		Date date = new Date();
		modelAndView.addObject("date", date);
		
		modelAndView.setViewName("Message");
		return modelAndView;
	}
			
}
