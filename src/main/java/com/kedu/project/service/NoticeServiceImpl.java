package com.kedu.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.NoticeDto;
import com.kedu.project.dto.SearchCriteria;
import com.kedu.project.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDao dao;
	
	@Transactional
	@Override
	public void regist(NoticeDto notice) throws Exception {
		dao.create(notice);
		System.out.println("notice ==================================");
		String[] files = notice.getFiles();
		
		if(files == null) {	return;	}
		
		for(String fileName : files) {
			System.out.println("=================" + notice.toString());
			dao.addAttach(fileName);
			System.out.println("nfileName ==================================");
		}
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public NoticeDto read(Integer nbno) throws Exception {
		dao.updateViewCnt(nbno);
		return dao.read(nbno);
	}

	@Transactional
	@Override
	public void modify(NoticeDto dto) throws Exception {
		dao.update(dto);
		
		Integer nbno = dto.getNbno();
		
		dao.deleteAttach(nbno);
		
		String[] files = dto.getFiles();
		
		if(files == null) { return; }
		
		for (String fileName : files) {
			dao.replaceAttach(fileName, nbno);
		}
		
	}

	@Transactional
	@Override
	public void remove(Integer nbno) throws Exception {
		dao.deleteAttach(nbno);
		dao.delete(nbno);
	}

	@Override
	public List<NoticeDto> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<NoticeDto> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<NoticeDto> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	@Override
	public List<String> getAttach(Integer nbno) throws Exception {
		return dao.getAttach(nbno);
	}

}
