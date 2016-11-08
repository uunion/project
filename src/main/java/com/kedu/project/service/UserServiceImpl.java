package com.kedu.project.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.project.dao.UserDao;
import com.kedu.project.dto.LoginDto;
import com.kedu.project.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	private UserDao uDao;

	@Override
	public UserDto login(LoginDto lDto) throws Exception {
		return uDao.login(lDto);
	}

	@Override
	public void keepLogin(String uid, String sessionId, Date next) throws Exception {
		uDao.keepLogin(uid, sessionId, next);
	}

	@Override
	public UserDto checkLoginBefore(String value) {
		return uDao.checkUserWithSessionKey(value);
	}
	
}
