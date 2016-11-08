package com.kedu.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.PageMaker;


import com.kedu.project.dto.ReplyDto;
import com.kedu.project.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Inject
	private ReplyService service;
//	공지 댓글 등록
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyDto dto) {
		ResponseEntity<String> entity = null;
		try {
			service.addReply(dto);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

//	공지 댓글 리스트
	@RequestMapping(value = "/all/{nbno}", method= RequestMethod.GET)
	public ResponseEntity<List<ReplyDto>> list(@PathVariable("nbno") Integer nbno) {
		ResponseEntity<List<ReplyDto>> entity = null;
		try{
			entity = new ResponseEntity<>(service.listReply(nbno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}


//	공지 댓글 업뎃
	@RequestMapping(value = "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyDto dto) {
		ResponseEntity<String> entity = null;
		try {
			dto.setRno(rno);
			service.modifyReply(dto);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}


//	공지 삭제문
	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.removeReply(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}


//	공지 댓글 페이징
	@RequestMapping(value = "/{nbno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(
			@PathVariable("nbno") Integer nbno, 
			@PathVariable("page") Integer page) {
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyDto> list = service.listReplyPage(nbno, cri);

			map.put("list", list);
			
			int replyCount = service.count(nbno);
			pageMaker.setTotalCount(replyCount);
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}


	
}
