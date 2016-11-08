package com.kedu.project.dao;

import java.util.List;

import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.QReplyDto;

public interface QReplyDao {
//	댓글 리스트
	public List<QReplyDto> listReply(Integer qbno) throws Exception;
//	댓글 등록
	public void insertReply(QReplyDto qrdto) throws Exception;
//	댓글 수정
	public void updateReply(QReplyDto qrdto) throws Exception;
//	댓글 삭제
	public void deleteReply(Integer rno) throws Exception;

//	댓글 리스트 (페이징 적용)
	public List<QReplyDto> listPage(Integer qbno , Criteria cri) throws Exception;
//	댓글 수
	public int count(Integer qbno) throws Exception;
//	조회수
	public int getQBno(Integer rno) throws Exception;
}
