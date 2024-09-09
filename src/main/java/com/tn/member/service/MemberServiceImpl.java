package com.tn.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tn.member.dao.MemberDAO;
import com.tn.member.model.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO dao;
	
	@Override
	@Transactional(readOnly = true)
	public List<Map<String, String>> getMember() {
		// TODO Auto-generated method stub
		return dao.getMember();
	}

	@Override
	public MemberVO getEditMemberInfo(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO loginMember(String userId, String userPwd) throws Exception {
		
		return dao.getMember(userId,userPwd);
	}

}
