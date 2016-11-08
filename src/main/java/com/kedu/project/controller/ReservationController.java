package com.kedu.project.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.project.dto.RpageMaker;
import com.kedu.project.dto.Paging;
import com.kedu.project.dto.ReservationDto;
import com.kedu.project.service.ReservationService;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {
	@Inject
	private ReservationService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@RequestMapping(value ="/register",method=RequestMethod.GET)
	public void insertGET(ReservationDto rDto,Model model) throws Exception{
	}
	@RequestMapping(value ="/register",method=RequestMethod.POST)
	public String registerPost(ReservationDto rDto,Model model)throws Exception{
		service.insert(rDto);
		model.addAttribute(rDto);
		return "redirect:/reservation/reservationListAll";
	}
	
	@RequestMapping(value="/reservationListAll" , method=RequestMethod.GET)
	public void reservationList(@ModelAttribute("paging")Paging paging,Model model) throws Exception{
		model.addAttribute("list",service.listPaging(paging));
		RpageMaker RpageMaker = new RpageMaker();
		RpageMaker.setPaging(paging);
		RpageMaker.setTotalCount(service.listCountPaging(paging));
		
		model.addAttribute("RpageMaker",RpageMaker);
	}
	
	@RequestMapping(value="/reservationRead", method=RequestMethod.GET)
	public void read(@RequestParam("rno")int rno,@ModelAttribute("paging")Paging paging, Model model)throws Exception{
		model.addAttribute(service.read(rno));
	}
	@RequestMapping(value="/reservationUpdate",method=RequestMethod.GET)
	public void updateGet(@RequestParam("rno")int rno, @ModelAttribute("paging")Paging paging,Model model) throws Exception{
		model.addAttribute(service.read(rno));
	}
	
	@RequestMapping(value="/reservationUpdate",method=RequestMethod.POST)
	public String updatePost(ReservationDto rDto, Paging paging,RedirectAttributes rttr) throws Exception{
		service.update(rDto);
		rttr.addAttribute("page",paging.getPage());
		rttr.addAttribute("perPageNum",paging.getPerPageNum());
		return "redirect:/reservation/reservationListAll";
	}
	
	@RequestMapping(value="/reservationDelete",method=RequestMethod.POST)
	public String delete(@RequestParam("rno")int rno,Paging paging,RedirectAttributes rttr)throws Exception{
		service.delete(rno);
		rttr.addAttribute("page",paging.getPage());
		rttr.addAttribute("perPageNum",paging.getPerPageNum());
		return "redirect:/reservation/reservationListAll";
	}									
	@RequestMapping(value="/map",method=RequestMethod.GET)
	public void mapGet()throws Exception{
		
	}
}
