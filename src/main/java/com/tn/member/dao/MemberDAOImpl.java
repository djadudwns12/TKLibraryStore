package com.tn.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public MemberVO getEditMemberInfo(String userId) {
		
		System.out.println("회원정보수정 : 로그인한 " + userId + "의 정보를 불러오기");
		return sess.selectOne(NS + ".getEditMemberInfo", userId);
	}
	
	
	
}
