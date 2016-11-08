package com.kedu.project.service;

import java.util.Date;

import com.kedu.project.dto.LoginDto;
import com.kedu.project.dto.MemberDto;

public interface MemberService {
	
	public MemberDto login(LoginDto dto) throws Exception;
	
	public void keepLogin(String memberid, String sessionId, Date next) throws Exception;
	
	public MemberDto checkLoginBefore(String value);
	
	public void join(MemberDto dto) throws Exception;

}
