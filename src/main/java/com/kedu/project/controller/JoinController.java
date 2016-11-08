package com.kedu.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String joinPOST(MemberDto dto,  Model model) throws Exception {
		
		logger.info("join post...");
		logger.info(dto.toString());
		
		service.join(dto);
		
		model.addAttribute("result", "success");
		
		return "/index";
	}
	
	//가입 후 각자 상세
	@RequestMapping(value = "/admin/memberDetail", method = RequestMethod.GET)
	public void read(@RequestParam("mno") int mno, Model model) throws Exception {
		
		model.addAttribute(service.read(mno));
	}
	
	@RequestMapping(value = "/admin/memberUpdate", method = RequestMethod.GET)
	public void updateGET(int mno, Model model) throws Exception {
		
		model.addAttribute(service.read(mno));
	}
	
	@RequestMapping(value = "/admin/memberUpdate", method = RequestMethod.POST)
	public String updatePOST(MemberDto dto, RedirectAttributes rttr) throws Exception {
		
		service.update(dto);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "/admin/memberDetail";
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("mno") int mno,HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		service.delete(mno);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		//자신의 아이디가 탈퇴가 된 후에 자동으로 로그아웃
		session.removeAttribute("login");
		session.invalidate();
		
		
		return "redirect:/index";
	}
	
}
