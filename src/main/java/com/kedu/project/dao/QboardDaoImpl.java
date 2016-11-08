package com.kedu.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.QboardDto;
import com.kedu.project.dto.SearchCriteria;

@Repository
public class QboardDaoImpl implements QboardDao {
//	sql세션(공장관리자) 가지고 오기
	@Inject
	private SqlSession session;
//	Mapper가지고 오기
	private static String namespace 
			="com.kedu.project.mapper";
//	게시물 하나 등록
	@Override
	public void create(QboardDto qdto) throws Exception{
		session.insert(namespace + ".create" , qdto);
	}
//	게시물 하나 읽기
	@Override
	public QboardDto read(Integer qbno) throws Exception {
	
		return session.selectOne(namespace + ".read" , qbno);
	}
//	게시물 하나 수정
	@Override
	public void update(QboardDto qdto) throws Exception {
		session.update(namespace + ".update" , qdto);
		
	}
//	게시물 하나 삭제
	@Override
	public void delete(Integer qbno) throws Exception {
		session.delete(namespace + ".delete" , qbno);
		
	}
//	게시물 전체 리스트 가지고 오기
	@Override
	public List<QboardDto> listAll() throws Exception {
		
		return session.selectList(namespace + ".listAll");
	}
//	페이지
	@Override
	public List<QboardDto> listPage(int page) throws Exception {
	
		if (page <= 0) {
			page = 1;
		}
		page = (page -1) * 10;
		return session.selectList(namespace + ".listPage" , page);
	}
//	pageMap이용
	@Override
	public List<QboardDto> listPageMap(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".listPage" , cri);
	}
//	글 수
	@Override
	public int countPaging(Criteria cri) throws Exception {
		
		return session.selectOne(namespace + ".countPaging" , cri);
	}
//	검색
	@Override
	public List<QboardDto> listSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace + ".listSearch" , cri);
	}
//	검색이후 글 수
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace + ".listSearchCount" , cri);
	}
//	댓글 글수
	@Override
	public void upReplyCnt(Integer qbno, int upcount) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("qbno", qbno);
		paramMap.put("upcount", upcount);
		
		session.update(namespace + ".upReplyCnt" , paramMap);
		
	}
//	조회수
	@Override
	public void upviewCnt(Integer qbno) throws Exception {
		
		session.update(namespace + ".upQviewCnt" , qbno);
		
	}
	@Override
	public void QaddAttach(String afullName) throws Exception {
		session.insert(namespace + ".QaddAttach", afullName);
		
	}
	@Override
	public List<String> QgetAttach(Integer qbno) throws Exception {
		return session.selectList(namespace + ".QgetAttach", qbno);
		
	}
	@Override
	public void QdeleteAttach(Integer qbno) throws Exception {
		session.delete(namespace + ".QdeleteAttach", qbno);
		
	}
	@Override
	public void QreplaceAttach(String afullName, Integer qbno) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("qbno", qbno);
		paramMap.put("afullName", afullName);
		
		session.insert(namespace + ".QreplaceAttach", paramMap);
		
	}
	
	
	
	
	
	

	
}
