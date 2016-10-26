package com.kedu.project.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FacebookController {
 
 
	@Inject
	ConnectionFactoryLocator cFactoryLocator; // Connection provide Class
 
	OAuth2Operations auth2Operations; // OAuth2.0 interface
 
	FacebookConnectionFactory connectionFactory; //facebook Connection Class
 
	/**
	 * facebook에서 accessToken을 받아 그 토큰을 가지고
	 * 접속하여 사용자 정보를 얻어옴.
	 * @param code
	 * @param req
	 * @param res
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(String code,HttpServletRequest req,HttpServletResponse res) {
		//토큰을 받음.
		String accessToken = code;
 
		System.out.println(accessToken);
 
		AccessGrant accessGrant = auth2Operations.exchangeForAccess(accessToken, "http://localhost:8080/member/login", null);
		Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
 
		System.out.println(connection);
 
		//FacebookTemplate 클래스는 인증이 없어도 기본적인 페이스북api를 이용할수있도록 만듬.
		Facebook facebook = (Facebook)(connection != null ? connection.getApi() : new FacebookTemplate());
 
		FacebookProfile profile = facebook.userOperations().getUserProfile();
 
		System.out.println(profile.getUsername());
 
		return "home";
	}
 
	/**
	 * 페이스북과 연결.
	 * @param req
	 * @param res
	 * @throws IOException
	 */
	@RequestMapping(value = "/start", method = RequestMethod.GET)
	public void fb(HttpServletRequest req,HttpServletResponse res) throws IOException {
		//facebook이란 id로 연결객체 생성
		connectionFactory = (FacebookConnectionFactory) cFactoryLocator.getConnectionFactory("facebook");
 
		//OAuth2 인증을 사용하겠다.
		auth2Operations = connectionFactory.getOAuthOperations();
		OAuth2Parameters parameters = new OAuth2Parameters();
		//email, user_about_me, user_birthday, user_hometown, user_website, offline_access, read_stream, publish_stream, read_friendlists
		parameters.setScope("user_about_me");
		//Redirection 주소
		parameters.setRedirectUri("http://localhost:8080/index");
		//권한코드 생성
		String authorizeUrl = auth2Operations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, parameters);
		//access 토큰요청
		res.sendRedirect(authorizeUrl);
	}
 
}