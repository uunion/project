package com.kedu.project.service;

import java.util.List;

import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.QReplyDto;

public interface QReplyService {
//	댓글 등록
	public void insert(QReplyDto qrdto)throws Exception;
//	댓글 리스트	
	public List<QReplyDto> list(Integer qbno) throws Exception;
//	댓 글 수정
	public void update(QReplyDto qrdto) throws Exception;
//	댓글 삭제
	public void delete(Integer rno) throws Exception;
//	댓글 리스트 (페이지 적용)
	public List<QReplyDto> listReplyPage(Integer qbno , Criteria cri)throws Exception;
//	댓글 수
	public int count(Integer qbno) throws Exception;
}
