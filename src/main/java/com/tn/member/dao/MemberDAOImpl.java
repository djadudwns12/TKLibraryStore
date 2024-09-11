package com.tn.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.member.model.dto.MemberDTO;
import com.tn.member.model.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	SqlSession sess;
	
	private String NS = "com.tn.mapper.memberMapper";
	
	public List<Map<String, String>> getMember() {
		// TODO Auto-generated method stub
		System.out.println("asdasd");
		List<Map<String, String>> aa = sess.selectList(NS+".getMember");
		System.out.println(sess.selectList(NS+".getMember"));
		return aa;
	}

	@Override
	public MemberVO getEditMemberInfo(String userId) throws Exception {
		
		System.out.println("ȸ���������� : �α����� " + userId + "�� ������ �ҷ�����");
		return sess.selectOne(NS + ".getEditMemberInfo", userId);
	}

	@Override
	public int updateEditMember(MemberDTO editMember) throws Exception {
		
		return sess.update(NS + ".updateEditMember", editMember);
	}
	
	
	
}
