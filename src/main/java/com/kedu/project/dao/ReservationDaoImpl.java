package com.kedu.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.project.dto.Paging;
import com.kedu.project.dto.ReservationDto;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	@Inject
	private SqlSession session;
	private static final String namespace = "com.kedu.project.mapper.ReservationMapper";
	@Override
	public void insert(ReservationDto rDto) {
		session.insert(namespace + ".insert" , rDto);
	}
	@Override
	public List<ReservationDto> listAll() throws Exception {
		return session.selectList(namespace +".listAll");
	}
	@Override
	public ReservationDto read(int rno) throws Exception {
		return session.selectOne(namespace +".read", rno);
	}
	@Override
	public List<ReservationDto> listPage(int page) throws Exception {
		if(page <= 0){
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace +".listPage",page);
	}
	@Override
	public List<ReservationDto> listPaging(Paging paging) throws Exception {
		return session.selectList(namespace+".listPaging", paging);
	}
	@Override
	public int countPageing(Paging paging) throws Exception {
		return session.selectOne(namespace + ".countPaging",paging);
	}
	@Override
	public void update(ReservationDto rDto) throws Exception {
		session.update(namespace +".update", rDto);
	}
	@Override
	public void delete(int rno) throws Exception {
		session.delete(namespace +".delete",rno);
	}
}
