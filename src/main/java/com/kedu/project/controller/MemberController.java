package com.kedu.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kedu.project.dto.LoginDto;
import com.kedu.project.dto.MemberDto;
import com.kedu.project.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDto dto) {
		
		
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
public void loginPost(LoginDto dto, HttpSession session, Model model) throws Exception {
		
		MemberDto ldto = service.login(dto);
		
		if (ldto == null) {
			return;
		}
		
		model.addAttribute("memberDto", ldto);
	}
}
