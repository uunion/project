package com.kedu.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.project.dto.Criteria;
import com.kedu.project.dto.QReplyDto;

@Repository
public class QReplyDaoImpl implements QReplyDao{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.project.mapper.QReplyMapper";
// 	댓글 리스트
	@Override
	public List<QReplyDto> listReply(Integer qbno) throws Exception {
		
		return session.selectList(namespace +".list", qbno);
	}
//	댓글 등록
	@Override
	public void insertReply(QReplyDto qrdto) throws Exception {
		
		session.insert(namespace + ".insert" , qrdto);
	}
//	댓글 수정
	@Override
	public void updateReply(QReplyDto qrdto) throws Exception {
		
		session.update(namespace + ".update" , qrdto);
	}
//	댓글 삭제
	@Override
	public void deleteReply(Integer rno) throws Exception {
		System.out.println("------------------ 실행?1-1 " + rno);
		session.delete(namespace + ".delete" , rno);
	}
	
//	댓글 리스트 페이지 적용
	@Override
	public List<QReplyDto> listPage(Integer qbno, Criteria cri) throws Exception {
	
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("qbno", qbno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".listPage" , paramMap);
	}
	
//	댓글 수
	@Override
	public int count(Integer qbno) throws Exception {
	
		return session.selectOne(namespace + ".count" , qbno);
	}
	
	@Override
	public int getQBno(Integer rno) throws Exception {
		return session.selectOne(namespace + ".getQBno" , rno);
	}
	
	
	
	
	
	
}
