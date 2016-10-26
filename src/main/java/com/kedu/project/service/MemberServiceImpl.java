package com.kedu.project.service;

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

}
