package com.kedu.project.service;

import com.kedu.project.dto.LoginDto;
import com.kedu.project.dto.MemberDto;

public interface MemberService {
	
	public MemberDto login(LoginDto dto) throws Exception;

}
