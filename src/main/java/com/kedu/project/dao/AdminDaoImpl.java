package com.kedu.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.project.dto.MemberDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.project.mapper.AdminMapper";
	
	@Override
	public void create(MemberDto dto) throws Exception {
		session.insert(namespace+".create", dto);
	}
	
	@Override
	public MemberDto read(String mno) throws Exception {
		return session.selectOne(namespace+".read", mno);
	}
	
	@Override
	public void update(MemberDto dto) throws Exception {
		session.update(namespace +".update", dto);
	}
	
	@Override 
	public void delete(String mno) throws Exception {
		session.delete(namespace+".delete", mno);
	}
	
	@Override
	public List<MemberDto> listAll() throws Exception {
		return session.selectList(namespace+".listAll");
	}
	
	
}
