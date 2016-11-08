package com.kedu.project.dao;

import java.util.List;

import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.NoticeDto;
import com.kedu.project.dto.SearchCriteria;

public interface NoticeDao {
	
public void create(NoticeDto dto) throws Exception;
	
	public NoticeDto read(Integer bno) throws Exception;
	
	public void update(NoticeDto dto) throws Exception;
	
	public void delete(Integer nbno) throws Exception;
	
	public List<NoticeDto> listAll() throws Exception;
	
	public List<NoticeDto> listPage(int page) throws Exception;
	
	public List<NoticeDto> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public List<NoticeDto> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public void updateNreplyCnt(Integer nbno, int amount) throws Exception;
	
	public void updateViewCnt(Integer nbno) throws Exception;
	
	public void addAttach(String afullName) throws Exception;
	
	public List<String> getAttach(Integer nbno) throws Exception;
	
	public void deleteAttach(Integer nbno) throws Exception;
	
	public void replaceAttach(String afullName, Integer nbno) throws Exception;

}
