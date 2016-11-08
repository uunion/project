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
	
	@Override
	public MemberDto read(int mno) throws Exception {
		return dao.read(mno);
	}
	
	@Override
	public void update(MemberDto dto) throws Exception {
		dao.update(dto);
	}
	
	@Override
	public void delete(int mno) throws Exception {
		dao.delete(mno);
	}
}
