package com.kedu.project.service;

import java.util.List;

import com.kedu.project.dto.MemberDto;

public interface AdminService {
	
	public void regist(MemberDto board) throws Exception;
	
	public MemberDto read(String mno) throws Exception;	
	
	public void modify(MemberDto dto) throws Exception;
	
	public void remove(String mno) throws Exception;
	
	public List<MemberDto> listAll() throws Exception;
	

}
