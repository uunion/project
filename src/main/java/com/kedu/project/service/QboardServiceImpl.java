package com.kedu.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.project.dao.QboardDao;

import com.kedu.project.dto.QboardDto;
import com.kedu.project.dto.SearchCriteria;
import com.kedu.project.dto.Criteria;

@Service
public class QboardServiceImpl implements QboardService{
//	다오 불러오기	
	@Inject
	private QboardDao dao;
//	하나 등록
	@Override
	public void insert(QboardDto qboard) throws Exception {
		dao.create(qboard);
		
		String[] files = qboard.getFiles();
		if(files == null) {	return;	}
		
		for(String fileName : files) {
			System.out.println("=================" + qboard.toString());
			dao.QaddAttach(fileName);
			
		}
		
	}
//	하나 읽기
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public QboardDto read(Integer qbno) throws Exception {
		dao.upviewCnt(qbno);
		return dao.read(qbno);
	}
//	하나 수정
	@Override
	public void update(QboardDto qboard) throws Exception {
		
		dao.update(qboard);
		
		Integer qbno = qboard.getQbno();
		
		dao.QdeleteAttach(qbno);
		
		String[] files = qboard.getFiles();
		
		if(files == null) { return; }
		
		for (String fileName : files) {
			dao.QreplaceAttach(fileName, qbno);
		}
	}
//	하나 삭제
	@Override
	public void delete(Integer qbno) throws Exception {
		dao.QdeleteAttach(qbno);
		dao.delete(qbno);
		
	}
//	전체 리스트
	@Override
	public List<QboardDto> listAll() throws Exception {

		return dao.listAll();
	}
//	페이지 리스트
	@Override
	public List<QboardDto> listPageMap(Criteria cri) throws Exception {
		
		return dao.listPageMap(cri);
	}
//	글수
	@Override
	public int listCountPage(Criteria cri) throws Exception {
	
		return dao.countPaging(cri);
	}
//	검색후 글
	@Override
	public List<QboardDto> listSearchPageMap(SearchCriteria cri) throws Exception {
		
		return dao.listSearch(cri);
	}
//	검색이후 글수
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}
	@Override
	public List<String> QgetAttach(Integer qbno) throws Exception {
		
		return dao.QgetAttach(qbno);
	}
	
	
	

}
