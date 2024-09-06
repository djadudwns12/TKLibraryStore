package com.tn.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tn.member.dao.MemberDAO;

@Service
public class TestServiceImpl implements TestService {
	@Autowired
	MemberDAO dao;
	
	@Override
	@Transactional(readOnly = true)
	public List<Map<String, String>> getMember() {
		// TODO Auto-generated method stub
		return dao.getMember();
	}

}
