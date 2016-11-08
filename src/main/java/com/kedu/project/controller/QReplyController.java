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

import com.kedu.project.dto.PageMaker;
import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.QReplyDto;
import com.kedu.project.service.QReplyService;


@RestController
@RequestMapping("/Qreplies")
public class QReplyController {
	
//	댓글 서비스정의
	@Inject
	private QReplyService service;
	
//	질문 댓글 등록
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody QReplyDto qrdto) {
	
		ResponseEntity<String> entity = null;
		try {
			service.insert(qrdto);
			entity = new ResponseEntity<String>("SUCCESS" , HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage() , HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
//	질문 댓글 리스트
	@RequestMapping(value = "/all/{qbno}" , method = RequestMethod.GET)
	public ResponseEntity<List<QReplyDto>> list(@PathVariable("bno") Integer qbno ) {
		
		ResponseEntity<List<QReplyDto>> entity = null;
		
		try {
			entity = new ResponseEntity<> (
					service.list(qbno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
//	질문 댓글 업뎃
	@RequestMapping(value = "/{rno}" , method = {RequestMethod.PUT , RequestMethod.PATCH })
	public ResponseEntity<String> update (
			@PathVariable("rno") Integer rno , @RequestBody QReplyDto qrdto) {
		
		ResponseEntity<String> entity = null;
		
		try {
			qrdto.setRno(rno);
			
			service.update(qrdto);
			
			entity = new ResponseEntity<String>("SUCCESS" , HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage() , HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
//	집에서 작성 학원에서 확인
//	질문 삭제문
	@RequestMapping(value ="/{rno}" , method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rno") Integer rno) {
		ResponseEntity<String> entity = null;
		
		try {
			
			service.delete(rno);
			
			entity = new ResponseEntity<String>("SUCCESS" , HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage() , HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
//	집에서 작성 
//	질문 댓글 패이징 적용
	@RequestMapping(value = "/{qbno}/{page}" , method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage (
			@PathVariable("qbno") Integer qbno ,
			@PathVariable("page") Integer page) {
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
//			페이징을 적용시킬수 있게 불러옵니다.
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String , Object>();
			List<QReplyDto> list = service.listReplyPage(qbno, cri);
			
			map.put("list", list);
			
			int replyCount = service.count(qbno);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
		
			entity = new ResponseEntity<Map<String, Object>>(map , HttpStatus.OK);
		}catch (Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
}
