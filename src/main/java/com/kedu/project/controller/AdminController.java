package com.kedu.project.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kedu.project.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	private AdminService service;
	

	
	@RequestMapping(value = "/memberList", method =RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		
	model.addAttribute("list", service.listAll());	
		
	
	}

}
