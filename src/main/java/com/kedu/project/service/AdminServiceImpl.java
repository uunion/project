package com.kedu.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.project.dao.AdminDao;
import com.kedu.project.dto.MemberDto;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDao dao;
	
	@Override
	public void regist(MemberDto dto) throws Exception {
	
	dao.create(dto);
	
	
}
	 
	
	 @Override
	 public MemberDto read(String bno) throws Exception {
		 return dao.read(bno);
	 }
	 
	 @Override
	 public void modify(MemberDto dto) throws Exception {
		 dao.update(dto);
		 
		
	 }
	 
	 @Override
	 public void remove(String bno) throws Exception {
		 dao.delete(bno);
	 }
	 
	 @Override
	 public List<MemberDto> listAll() throws Exception {
		 return dao.listAll();
	 }
	 
	
	
}
