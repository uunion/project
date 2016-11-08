package com.kedu.project.dao;

import java.util.List;

import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.QboardDto;
import com.kedu.project.dto.SearchCriteria;


public interface QboardDao {
//	게시물 하나 등록
	public void create(QboardDto qdto) throws Exception;
//	게시물 하나 검색
	public QboardDto read(Integer qbno)throws Exception; 
//	게시물 하나 수정	
	public void update(QboardDto qdto)throws Exception;
//	게시물 하나 삭제
	public void delete(Integer qbno)throws Exception;
//	게시물 전체 리스트
	public List<QboardDto> listAll()throws Exception; 
//	게시물 페이징
	public List<QboardDto> listPage(int page)throws Exception;
//	PageMap이용
	public List<QboardDto> listPageMap(Criteria cri)throws Exception;
//	글 수
	public int countPaging(Criteria cri)throws Exception;
//	검색
	public List<QboardDto> listSearch(SearchCriteria cri)throws Exception;
//	검색이후 글수
	public int listSearchCount (SearchCriteria cri)throws Exception;
//	댓글수 카운트
	public void upReplyCnt(Integer qbno , int upcount)throws Exception;
//	조회수 카운트
	public void upviewCnt(Integer qbno) throws Exception; 
	
	public void QaddAttach(String afullName) throws Exception;
	
	public List<String> QgetAttach(Integer qbno) throws Exception;
	
	public void QdeleteAttach(Integer qbno) throws Exception;
	
	public void QreplaceAttach(String afullName, Integer qbno) throws Exception;
}
