package com.tn.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.member.model.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO  {

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
	
	public MemberVO getMember(String userId, String userPwd) throws Exception {
		Map<String, String> loginMember = new HashMap<>();
		
		loginMember.put("userId", userId);
		loginMember.put("userPwd", userPwd);
	
		return sess.selectOne(NS+".getLoginMember", loginMember);
	}
	
	
}
