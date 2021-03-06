package com.kedu.project.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.kedu.project.dto.LoginDto;
import com.kedu.project.dto.UserDto;
import com.kedu.project.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private UserService service;
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("lDto") LoginDto lDto){
		
	}
	@RequestMapping(value="/loginPost",method=RequestMethod.POST)
	public void loginPOST(LoginDto lDto,HttpSession session,Model model)throws Exception{
		UserDto uDto = service.login(lDto);
		System.out.println("uDto = "+uDto + " lDto"+lDto);
		
		if(uDto == null){
			return;
		}
		model.addAttribute("userDto",uDto);
		if(lDto.isUseCookie()){
			int amount = 60*60*24*7;
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			service.keepLogin(uDto.getUid(),session.getId(),sessionLimit);
		}
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{
		Object obj = session.getAttribute("login");
		if(obj != null){
			UserDto uDto = (UserDto) obj;
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);;
				service.keepLogin(uDto.getUid(),session.getId(),new Date());
			}
		}
		return "user/logout";
	}
}
