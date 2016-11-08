package com.kedu.project.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.project.dto.LoginDto;
import com.kedu.project.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
	@Inject 
	private SqlSession session;
	private static String namespace = "com.kedu.project.mapper.UserMapper";
	@Override
	public UserDto login(LoginDto lDto) throws Exception {
		return session.selectOne(namespace + ".login", lDto);
	}
	@Override
	public void keepLogin(String uid, String sessionId, Date next) {
		Map<String,Object> paramMap = new HashMap<String,Object>();
			paramMap.put("uid", uid);
			paramMap.put("sessionId", sessionId);
			paramMap.put("next", next);
			
			session.update(namespace+".keepLogin",paramMap);
	}
	@Override
	public UserDto checkUserWithSessionKey(String value) {
		return session.selectOne(namespace+".checkUserWithSessionKey",value);
	}
	
}
