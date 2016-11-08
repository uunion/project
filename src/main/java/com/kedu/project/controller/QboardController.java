package com.kedu.project.controller;



import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.project.dto.PageMaker;
import com.kedu.project.dto.QboardDto;
import com.kedu.project.dto.SearchCriteria;
import com.kedu.project.service.QboardService;

@Controller
@RequestMapping("/Qboard")
public class QboardController {
	
	private static final Logger logger = LoggerFactory.getLogger(QboardController.class);
	
	@Inject
	private QboardService service;
//	등록이동
	@RequestMapping(value = "/register" , method = RequestMethod.GET)
	public void registerGET(QboardDto qboard, Model model)throws Exception{
		logger.info("등록 사용");
	}
//	등록
	@RequestMapping(value = "/register" , method = RequestMethod.POST)
	public String registerPOST(QboardDto qboard, RedirectAttributes rttr)throws Exception {
		
		logger.info("등록 사용");
		service.insert(qboard);
//		나중 수정부분
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/Qboard/listPageMap";
	}
//	전체 페이지
	@RequestMapping(value = "list" , method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		logger.info("리스트 사용");
		model.addAttribute("list" , service.listAll());
	}
//	상세페이지
	@RequestMapping(value = "/readPage" , method = RequestMethod.GET)
	public void read(@RequestParam("qbno") int qbno ,
			@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("리드 사용");

		model.addAttribute("QboardDto" , service.read(qbno));
	
	}
//	삭제
	@RequestMapping(value = "/delete" , method = RequestMethod.POST)
	public String delete(@RequestParam("qbno") int qbno ,
			RedirectAttributes rttr, SearchCriteria cri)throws Exception {
		logger.info("삭제 사용");
		service.delete(qbno);
		
		rttr.addAttribute("page" , cri.getPage());
		rttr.addAttribute("perPageNum" , cri.getPerPageNum());
		rttr.addAttribute("searchType" , cri.getSearchType());
		rttr.addAttribute("keyword" , cri.getKeyword());
	
		return "redirect:/Qboard/listPageMap";
	}
//	수정페이지 이동
	@RequestMapping(value = "/update" , method = RequestMethod.GET)
	public void updateGET(int qbno , Model model , @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		logger.info("수정(겟) 사용");
		model.addAttribute("QboardDto" , service.read(qbno));
	}
	
//	실제 수정 
	@RequestMapping(value = "/update" , method = RequestMethod.POST)
	public String updatePOST(QboardDto qboard ,
			RedirectAttributes rttr , SearchCriteria cri) throws Exception {
		logger.info("수정(포스트) 사용");
		service.update(qboard);
		
		rttr.addAttribute("page" , cri.getPage());
		rttr.addAttribute("perPageNum" , cri.getPerPageNum());
		rttr.addAttribute("searchType" , cri.getSearchType());
		rttr.addAttribute("keyword" , cri.getKeyword());
		
		return "redirect:/Qboard/listPageMap";
	}
	
//	리스트 페이지(+검색)
	@RequestMapping(value = "/listPageMap" , method = RequestMethod.GET)
	public void listPageMap(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info(cri.toString());
		model.addAttribute("list" , service.listSearchPageMap(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker" , pageMaker);
	}
//	파일 업로드
	@RequestMapping("/QgetAttach/{qbno}")
	@ResponseBody
	public List<String> QgetAttach(@PathVariable("qbno")Integer qbno) throws Exception {
		return service.QgetAttach(qbno);
	}
}	
