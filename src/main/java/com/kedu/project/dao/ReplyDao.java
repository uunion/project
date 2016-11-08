package com.kedu.project.dao;

import java.util.List;

import com.kedu.project.dto.Criteria;


import com.kedu.project.dto.ReplyDto;

public interface ReplyDao {
//	공지 댓글 리스트
	public List<ReplyDto> list(Integer nbno) throws Exception;
//	공지 댓글 등록
	public void create(ReplyDto dto) throws Exception;
//	공지 댓글 수정
	public void update(ReplyDto dto) throws Exception;
//	공지 댓글 삭제
	public void delete(Integer nrno) throws Exception;
//	공지 댓글 리스트(패이징)
	public List<ReplyDto> listPage(Integer nbno, Criteria cri) throws Exception;
//	공지 댓글 수
	public int count(Integer nbno) throws Exception;
//	공지 조회수
	public int getNbno(Integer rno) throws Exception;


}
