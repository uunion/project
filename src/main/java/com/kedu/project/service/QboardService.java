package com.kedu.project.service;

import java.util.List;

import com.kedu.project.dto.SearchCriteria;
import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.QboardDto;

public interface QboardService {
// 	하나 등록
	public void insert(QboardDto qboard) throws Exception;
// 	하나 글읽기
	public QboardDto read(Integer qbno) throws Exception;
//	하나 수정	
	public void update(QboardDto qboard) throws Exception;
//	하나 삭제
	public void delete(Integer qbno) throws Exception;
//	전체 글 리스트
	public List<QboardDto> listAll() throws Exception;
//	pageMap 이용
	public List<QboardDto> listPageMap(Criteria cri)throws Exception;
//	글수 
	public int listCountPage(Criteria cri) throws Exception;
	
	public List<QboardDto> listSearchPageMap(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	public List<String> QgetAttach(Integer qbno) throws Exception;
}
