package com.sist.dao.mapper;

import com.sist.dao.MemberVO;

public interface MemberMapper {
	public int idCheck(String id);
	public String pwdCheck(String pwd);
	public void joinMember(MemberVO vo);
	public int getGrade(String id);	
}