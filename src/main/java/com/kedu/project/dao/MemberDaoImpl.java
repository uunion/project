package com.kedu.project.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.project.dto.LoginDto;
import com.kedu.project.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.project.mapper.MemberMapper";
	
	@Override
	public MemberDto login(LoginDto dto) throws Exception {
		
		return session.selectOne(namespace +".login", dto);
	}

}
