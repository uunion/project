package com.kedu.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.project.dto.Criteria;


import com.kedu.project.dto.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Inject
	private SqlSession session;
	private static String namespace = "com.kedu.project.mapper.nreplyMapper";
	
	
	@Override
	public List<ReplyDto> list(Integer nbno) throws Exception {
		return session.selectList(namespace + ".list", nbno);
	}

	@Override
	public void create(ReplyDto dto) throws Exception {
		session.insert(namespace + ".create", dto);
	}

	@Override
	public void update(ReplyDto dto) throws Exception {
		session.update(namespace + ".update", dto);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		session.delete(namespace + ".delete", rno);
	}
	
	@Override
	public List<ReplyDto> listPage(Integer nbno, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("nbno", nbno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".listPage", paramMap);
	}
	
	@Override
	public int count(Integer nbno) throws Exception {
		return session.selectOne(namespace + ".count", nbno);
	}
	
	@Override
	public int getNbno(Integer rno) throws Exception {
		return session.selectOne(namespace + ".getNbno", rno);
	}
	
}