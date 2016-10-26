package com.sist.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.sist.dao.mapper.MemberMapper;
import com.sist.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Resource(name="memberMapper")
	private MemberMapper mapper;

	@Override
	public boolean memberId(String id) throws Exception {
		// TODO Auto-generated method stub
		boolean check = false;
		
		int idCheck = mapper.idCheck(id);
		
		if(idCheck == 1){
			check = true;
		}
		
		return check;
	}

	@Override
	public boolean memberPwd(String id,String pwd) throws Exception {
		// TODO Auto-generated method stub
		
		boolean check = false;
		
		String dbPwd = mapper.pwdCheck(id);
		
		if(pwd.equals(pwd)){
			check = true;
		}
		
		return check;
	}
	

}
