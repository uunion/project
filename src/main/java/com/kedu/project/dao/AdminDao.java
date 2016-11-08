package com.kedu.project.dao;

import java.util.List;

import com.kedu.project.dto.MemberDto;

public interface AdminDao {
	
	
	public void create(MemberDto dto) throws Exception;
	
	public MemberDto read(String mno) throws Exception;
	
	public void update(MemberDto dto) throws Exception;
	
	public void delete(String mno) throws Exception;
	
	public List<MemberDto> listAll() throws Exception;

}
