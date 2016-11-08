package com.kedu.project.dao;

import java.util.Date;

import com.kedu.project.dto.LoginDto;
import com.kedu.project.dto.MemberDto;

public interface MemberDao {

	public MemberDto login(LoginDto dto) throws Exception;
	
	public void keepLogin(String memberid, String sessionId, Date next);
	
	public MemberDto checkUserWithSessionKey(String value);
	
	//가입, 수정, 삭제
	public void join(MemberDto dto) throws Exception;
	
	public MemberDto read(int mno) throws Exception;
	
	public void update(MemberDto dto) throws Exception;
	
	public void delete(int mno) throws Exception;
	
}
