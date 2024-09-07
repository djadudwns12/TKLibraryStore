package com.tn.member.dao;

import java.util.List;
import java.util.Map;

import com.tn.member.model.vo.MemberVO;

public interface MemberDAO {

	List<Map<String, String>> getMember();
	
	// 회원정보수정을 위해 회원정보를 불러오는 메서드
	MemberVO getEditMemberInfo(String userId);
	
	
	
}
