package com.kedu.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.project.dao.ReservationDao;
import com.kedu.project.dto.Paging;
import com.kedu.project.dto.ReservationDto;
@Service
public class ReservationServiceImpl implements ReservationService {
	@Inject
	private ReservationDao rDao;
	@Override
	public void insert(ReservationDto rDto) throws Exception {
		rDao.insert(rDto);
	}
	@Override
	public List<ReservationDto> listAll() throws Exception {
		return rDao.listAll();
	}
	@Override
	public ReservationDto read(int rno) throws Exception {
		return rDao.read(rno);
	}
	@Override
	public List<ReservationDto> listPaging(Paging paging) throws Exception {
		return rDao.listPaging(paging);
	}
	@Override
	public int listCountPaging(Paging paging) throws Exception {
		return rDao.countPageing(paging);
				
	}
	@Override
	public void update(ReservationDto rDto) throws Exception {
		rDao.update(rDto);
	}
	@Override
	public void delete(int rno) throws Exception {
		rDao.delete(rno);
	}

}
