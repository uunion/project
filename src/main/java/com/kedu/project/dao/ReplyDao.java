package com.kedu.project.dao;

import java.util.List;

import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.ReplyDto;

public interface ReplyDao {

	public List<ReplyDto> list(Integer nbno) throws Exception;
	
	public void create(ReplyDto dto) throws Exception;
	
	public void update(ReplyDto dto) throws Exception;
	
	public void delete(Integer nrno) throws Exception;
	
	public List<ReplyDto> listPage(Integer nbno, Criteria cri) throws Exception;
	
	public int count(Integer nbno) throws Exception;
	
	public int getNbno(Integer rbno) throws Exception;
	
}
