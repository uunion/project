package com.kedu.project.dao;

import java.util.List;

import com.kedu.project.dto.Paging;
import com.kedu.project.dto.ReservationDto;

public interface ReservationDao {
	public void insert(ReservationDto rDto) throws Exception;
	public List<ReservationDto> listAll() throws Exception;
	public ReservationDto read(int rno) throws Exception;
	public List<ReservationDto> listPage(int page) throws Exception;
	public List<ReservationDto> listPaging(Paging paging) throws Exception;
	public int countPageing(Paging paging)throws Exception;
	public void update(ReservationDto rDto)throws Exception;
	public void delete(int rno)throws Exception;
}
