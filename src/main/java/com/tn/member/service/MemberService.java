package com.tn.member.service;


import java.util.List;
import java.util.Map;
import org.springframework.http.ResponseEntity;

import com.tn.member.model.vo.MemberVO;

public interface MemberService {

	List<Map<String, String>> getMember();

	MemberVO getEditMemberInfo(String userId);
	// 로그인 시키는 메서드
	MemberVO loginMember(String userId, String userPwd) throws Exception;
  
  public ResponseEntity<Integer> sendOne(String phone) throws Exception;
}
