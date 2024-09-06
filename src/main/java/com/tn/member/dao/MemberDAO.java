package com.tn.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

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
	
	
}
