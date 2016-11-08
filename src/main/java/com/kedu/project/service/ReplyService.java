package com.kedu.project.service;

import java.util.List;

import com.kedu.project.dto.Criteria;


import com.kedu.project.dto.ReplyDto;

public interface ReplyService {
//	공지 댓글 등록
	public void addReply(ReplyDto dto) throws Exception;
//	공지 댓글 리스트
	public List<ReplyDto> listReply(Integer nbno) throws Exception;
//	공지 댓글 수정
	public void modifyReply(ReplyDto dto) throws Exception;
//	공지 댓글 삭제
	public void removeReply(Integer rno) throws Exception;
//	공지 댓글 리스트(페이징적용)
	public List<ReplyDto> listReplyPage(Integer nbno, Criteria cri) throws Exception;
//	공지 댓글 수
	public int count(Integer nbno) throws Exception;

}
