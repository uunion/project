package com.kedu.project.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
	
	@Override
	public void keepLogin(String memberid, String sessionId, Date next) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memberid", memberid);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		
		session.update(namespace+".keepLogin", paramMap);
	}
	
	@Override
	public MemberDto checkUserWithSessionKey(String value) {
		
		return session.selectOne(namespace + ".checkUserWithSessionKey", value);
	}
	
	//가입
	@Override 
	public void join(MemberDto dto) throws Exception {
		session.insert(namespace+".join", dto);
	}
	
	@Override
	public MemberDto read(int mno) throws Exception {
		return session.selectOne(namespace+".read", mno);
	}
	
	@Override
	public void update(MemberDto dto) throws Exception {
		session.update(namespace +".update", dto);
	}
	
	@Override
	public void delete(int mno) throws Exception {
		session.delete(namespace+".delete", mno);
	}

}
