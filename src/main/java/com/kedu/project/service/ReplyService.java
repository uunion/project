package com.kedu.project.service;

import java.util.List;

import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.ReplyDto;

public interface ReplyService {

	public void addReply(ReplyDto dto) throws Exception;
	
	public List<ReplyDto> listReply(Integer nbno) throws Exception;
	
	public void modifyReply(ReplyDto dto) throws Exception;
	
	public void removeReply(Integer rbno) throws Exception;
	
	public List<ReplyDto> listReplyPage(Integer nbno, Criteria cri) throws Exception;
	
	public int count(Integer nbno) throws Exception;
	
}
