package com.kedu.project.dao;

import com.kedu.project.dto.LoginDto;
import com.kedu.project.dto.MemberDto;

public interface MemberDao {

	public MemberDto login(LoginDto dto) throws Exception;
	
}
