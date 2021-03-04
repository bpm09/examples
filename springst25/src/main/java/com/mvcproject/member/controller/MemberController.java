package com.mvcproject.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.mvcproject.member.controller.model.dao.MemberDAO;
import com.mvcproject.member.controller.model.service.MemberService;
import com.mvcproject.member.controller.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberservice;
	
	
	@RequestMapping(value="memberList.do", method=RequestMethod.GET)
	public ModelAndView memberListService(ModelAndView modelAndView) throws Exception{
		
		List<Member> memberList = memberservice.selectMemberAll();
		
		modelAndView.addObject("memberList", memberList);
		modelAndView.setViewName("member/memberList");

		
		// for(int i=0; i<memberList.size(); i++) {
		//	System.out.println(i+1+"번째 : "+memberList.get(i));
		// }
		return modelAndView;
	}
	
	
	@RequestMapping(value="memberView.do", method=RequestMethod.GET)
	public String memberViewService(@RequestParam("id") String id, Model model, HttpServletRequest request) throws Exception {
		
		Member member = memberservice.selectMember(id);
		model.addAttribute("member", member);

		return "member/memberView";
	}
	
	
	@RequestMapping(value="memberDelete.do", method=RequestMethod.GET)
	public ModelAndView deleteMember(Member member, ModelAndView modelAndView) throws Exception {
		
		int cnt = memberservice.deleteMember(member);
		
		modelAndView.addObject("cnt", cnt);
		modelAndView.setViewName("redirect:memberList.do");
		// modelAndView.setView(new RedirectView("redirect:memberList.do"));
		
		return modelAndView;
	}
	
	@RequestMapping(value="WirteBridge.do", method=RequestMethod.GET)
	public ModelAndView writeMember(ModelAndView modelAndView) throws Exception{
		
		modelAndView.setViewName("member/memberInsert");
		return modelAndView;
		
	}
	
	@ResponseBody
	@RequestMapping(value="updateBridge.do")
	public ModelAndView myinfo(ModelAndView modelAndView, @RequestParam("id")String id) throws Exception{
		
		Member member = memberservice.selectMember(id);
		
		modelAndView.addObject("member", member);
		modelAndView.setViewName("member/memberUpdate");
		return modelAndView;
		
	}

	
	@ResponseBody
	@RequestMapping(value="memberInsert.do")
	public String insertMember(Member member) throws Exception{
		System.out.println("멤버인서트");
		
		String id = member.getId();
		System.out.println(id);
	
		String cnt = Integer.toString(memberservice.insertMember(member));
		System.out.println(member);
		System.out.println(cnt);
		
		return cnt;

		
		
	}
	
	@ResponseBody
	@RequestMapping(value="memberUpdate.do", method=RequestMethod.POST)
	public String updateMember(Member member) throws Exception {
		System.out.println("수정하기 눌름");
		String cnt = Integer.toString(memberservice.updateMember(member));
		
		return cnt;
	}
	
	
	@ResponseBody
	@RequestMapping(value="idCheck.do", method=RequestMethod.POST)
	public String idCheck(@RequestParam("id") String id) throws Exception {
		System.out.println("idcheck.do로 들어옴");
		System.out.println(id);
		String cnt = Integer.toString(memberservice.idCheck(id));
		System.out.println(cnt);
		return cnt;
	}
	
	
}