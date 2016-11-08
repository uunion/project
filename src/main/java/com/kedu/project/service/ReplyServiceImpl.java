package com.kedu.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.ReplyDto;
import com.kedu.project.dao.NoticeDao;
import com.kedu.project.dao.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDao replyDao;
	
	@Inject
	private NoticeDao noticeDao;
	
	@Transactional
	@Override
	public void addReply(ReplyDto dto) throws Exception {
		replyDao.create(dto);
		noticeDao.updateNreplyCnt(dto.getNbno(), 1);
	}

	@Override
	public List<ReplyDto> listReply(Integer nbno) throws Exception {
		return replyDao.list(nbno);
	}

	@Override
	public void modifyReply(ReplyDto dto) throws Exception {
		replyDao.update(dto);
	}

	@Transactional
	@Override
	public void removeReply(Integer rbno) throws Exception {
		int nbno = replyDao.getNbno(rbno);
		replyDao.delete(rbno);
		noticeDao.updateNreplyCnt(nbno, -1);
	}
	
	@Override
	public List<ReplyDto> listReplyPage(Integer nbno, Criteria cri) throws Exception {
		return replyDao.listPage(nbno, cri);
	}
	
	@Override
	public int count(Integer nbno) throws Exception {
		return replyDao.count(nbno);
	}

}
