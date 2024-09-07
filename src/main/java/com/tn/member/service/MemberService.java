package com.tn.member.service;

import java.util.List;
import java.util.Map;

import com.tn.member.model.vo.MemberVO;

public interface MemberService {

	List<Map<String, String>> getMember();
	
	// 회원정보수정을 위해 회원정보를 불러오는 메서드
	MemberVO getEditMemberInfo(String userId) throws Exception;
}
