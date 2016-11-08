package com.kedu.project.dao;

import java.util.Date;

import com.kedu.project.dto.LoginDto;
import com.kedu.project.dto.UserDto;

public interface UserDao {
	public UserDto login(LoginDto lDto) throws Exception;
	public void keepLogin(String uid, String sessionId, Date next);
	public UserDto checkUserWithSessionKey(String value);
}
