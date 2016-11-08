package com.kedu.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.project.dao.QboardDao;
import com.kedu.project.dao.QReplyDao;
import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.QReplyDto;
@Service
public class QReplyServiceImpl implements QReplyService{
	
	@Inject
	private QboardDao qbdao;
//	댓글 다오 qrdao정의
	@Inject
	private QReplyDao qrdao;
//	댓글 등록
	@Transactional
	@Override
	public void insert(QReplyDto qrdto) throws Exception {
		
		qrdao.insertReply(qrdto);
		
		qbdao.upReplyCnt(qrdto.getQbno(), 1);
	}
//	댓글 리스트
	@Override
	public List<QReplyDto> list(Integer qbno) throws Exception {
		
		return qrdao.listReply(qbno);
		
	}
//	댓글 업뎃
	@Transactional
	@Override
	public void update(QReplyDto qrdto) throws Exception {
		
		qrdao.updateReply(qrdto);
		qbdao.upReplyCnt(qrdto.getQbno(), 1);
	}
//	댓글 삭제
	@Transactional
	@Override
	public void delete(Integer rno) throws Exception {
	
		int qbno = qrdao.getQBno(rno);
	
		qrdao.deleteReply(rno);
	
		qbdao.upReplyCnt(qbno, -1);
	}

//	댓글 리스트 (패이지 적용)
	@Override
	public List<QReplyDto> listReplyPage(Integer qbno, Criteria cri) throws Exception {
	
		return qrdao.listPage(qbno, cri);
	}
//	댓글 수
	@Override
	public int count(Integer qbno) throws Exception {
	
		return qrdao.count(qbno);
	}
	
	

	
}
