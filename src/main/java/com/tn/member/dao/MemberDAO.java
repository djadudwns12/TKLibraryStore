package com.tn.member.dao;

import java.util.List;
import java.util.Map;

import com.tn.member.model.vo.MemberVO;

public interface MemberDAO {
	
	public List<Map<String, String>> getMember();
	
	public MemberVO getMember(String userId, String userPwd) throws Exception;
}
