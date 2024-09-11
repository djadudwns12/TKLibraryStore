package com.tn.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tn.member.dao.MemberDAO;
import com.tn.member.dao.MemberDAOImpl;
import com.tn.member.model.dto.MemberDTO;
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
	public MemberVO getEditMemberInfo(String userId) throws Exception {
		
		return dao.getEditMemberInfo(userId);
	}

	@Override
	public boolean saveEditInfo(MemberDTO editMember) throws Exception {
		System.out.println("Service : 회원정보수정 저장 >> " + editMember.toString() );
		boolean result = false;
		if(dao.updateEditMember(editMember) == 1) {
			result = true;
		}		
		return result;
	}

}
