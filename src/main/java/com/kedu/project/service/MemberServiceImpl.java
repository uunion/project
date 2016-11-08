package com.kedu.project.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.project.dao.MemberDao;
import com.kedu.project.dto.LoginDto;
import com.kedu.project.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao dao;
	
	@Override
	public MemberDto login(LoginDto dto) throws Exception {
		
		return dao.login(dto);
	}
	@Override
	public void keepLogin(String memberid, String sessionId, Date next) throws Exception {
		
		dao.keepLogin(memberid, sessionId, next); 
	}
	
	@Override
	public MemberDto checkLoginBefore(String value) {
		
		return dao.checkUserWithSessionKey(value);
	}
	
	@Override
	public  void join(MemberDto dto) throws Exception {
		dao.join(dto);
	}

}
