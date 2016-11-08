package com.kedu.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.NoticeDto;
import com.kedu.project.dto.SearchCriteria;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.project.mapper.NoticeMapper";
	
	@Override
	public void create(NoticeDto dto) throws Exception {
		session.insert(namespace + ".create", dto);
	}

	@Override
	public NoticeDto read(Integer nbno) throws Exception {
		return session.selectOne(namespace + ".read", nbno);
	}

	@Override
	public void update(NoticeDto dto) throws Exception {
		session.update(namespace + ".update", dto);
	}

	@Override
	public void delete(Integer nbno) throws Exception {
		session.delete(namespace + ".delete", nbno);
	}

	@Override
	public List<NoticeDto> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}
	
	@Override
	public List<NoticeDto> listPage(int page) throws Exception {
		if(page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace + ".listPage", page);
	}
	
	@Override
	public List<NoticeDto> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}
	
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}
	
	@Override
	public List<NoticeDto> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
	@Override
	public void updateNreplyCnt(Integer nbno, int amount) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("nbno", nbno);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updateNreplyCnt", paramMap);
	}
	
	@Override
	public void updateViewCnt(Integer nbno) throws Exception {
		session.update(namespace + ".updateViewCnt", nbno);
	}
	
	@Override
	public void addAttach(String afullName) throws Exception {
		session.insert(namespace + ".addAttach", afullName);
	}
	
	@Override
	public List<String> getAttach(Integer nbno) throws Exception {
		return session.selectList(namespace + ".getAttach", nbno);
	}
	
	@Override
	public void deleteAttach(Integer nbno) throws Exception {
		session.delete(namespace + ".deleteAttach", nbno);
	}
	
	@Override
	public void replaceAttach(String afullName, Integer nbno) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("nbno", nbno);
		paramMap.put("afullName", afullName);
		
		session.insert(namespace + ".replaceAttach", paramMap);
		
	}

}
