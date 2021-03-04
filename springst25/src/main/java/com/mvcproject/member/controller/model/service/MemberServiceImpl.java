package com.mvcproject.member.controller.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvcproject.member.controller.model.dao.MemberDAO;
import com.mvcproject.member.controller.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public List<Member> selectMemberAll() throws Exception {
		List<Member> memberList = memberDAO.selectMemberAll();
		return memberList;
	}
	
	@Override
	public Member selectMember(String userid) throws Exception{
		Member member = memberDAO.selectMember(userid);
		return member;
	}
	
	@Override
	public  int insertMember(Member member) throws Exception{
		int cnt = memberDAO.insertMember(member);
		return cnt;
	}
	
	@Override
	public int updateMember(Member member) throws Exception{
		int cnt = memberDAO.updateMember(member);
		return cnt;
	}
	
	@Override
	public int deleteMember(Member member) throws Exception{
		int cnt = memberDAO.deleteMember(member);
		return cnt;
	}
	
	@Override
	public int idCheck(String id) throws Exception {
		int cnt = memberDAO.idCheck(id);
		return cnt;
	}

}
