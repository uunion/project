package com.kedu.project.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kedu.project.HomeController;
import com.kedu.project.dto.MemberDto;
import com.kedu.project.service.MemberService;

@Controller
public class JoinController {


	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private MemberService service;
	
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET(MemberDto dto, Model model) {
		
		logger.info("join get...");
		
		
	
//		return "join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberDto dto, Model model) throws Exception {
		
		logger.info("join post...");
		logger.info(dto.toString());
		
		service.join(dto);
		
		model.addAttribute("result", "success");
		
		return "/index";
	}
}
