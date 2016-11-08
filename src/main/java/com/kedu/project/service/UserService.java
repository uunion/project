package com.kedu.project.service;

import java.util.Date;

import com.kedu.project.dto.LoginDto;
import com.kedu.project.dto.UserDto;

public interface UserService {
	public UserDto login(LoginDto lDto) throws Exception;
	public void keepLogin(String uid, String sessionId,Date next)throws Exception;
	public UserDto checkLoginBefore(String value);
}
