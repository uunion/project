package com.kedu.project.service;

import java.util.List;

import com.kedu.project.dto.NoticeDto;
import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.SearchCriteria;

public interface NoticeService {

	public void regist(NoticeDto dto) throws Exception;
	
	public NoticeDto read(Integer nbno) throws Exception;
	
	public void modify(NoticeDto dto) throws Exception;
	
	public void remove(Integer nbno) throws Exception;
	
	public List<NoticeDto> listAll() throws Exception;
	
	public List<NoticeDto> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public List<NoticeDto> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public List<String> getAttach(Integer nbno) throws Exception;
	
}
