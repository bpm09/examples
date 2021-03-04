package com.mvcproject.member.controller.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvcproject.member.controller.model.vo.Member;

@Repository	 // @Controller
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MemberDAO() {}
	
	public List<Member> selectMemberAll() throws Exception {
		List<Member> memberList = sqlSession.selectList("Member.selectMemberAll");
		return memberList;
	}

	public Member selectMember(String userid) throws Exception{
		Member member = sqlSession.selectOne("Member.selectMember", userid);
		return member;
	}
	
	public int deleteMember(Member member) throws Exception{
		int cnt = sqlSession.delete("Member.deleteMember", member);
		return cnt;
	}
	
	public int insertMember(Member member) throws Exception{
		int cnt = sqlSession.insert("Member.insertMember", member);
		return cnt;
	}
	
	public int updateMember(Member member) throws Exception{
		int cnt = sqlSession.update("Member.updateMember", member);
		return cnt;
	}
	
	public int idCheck(String userid) throws Exception{
		int cnt = sqlSession.selectOne("Member.idCheck", userid); 
		return cnt;
	}
}