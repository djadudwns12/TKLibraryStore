package com.tn.member.service;

import java.util.List;
import java.util.Map;

import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.member.model.dto.MemberDTO;
import org.springframework.http.ResponseEntity;


import com.tn.member.model.vo.MemberVO;

public interface MemberService {

	List<Map<String, String>> getMember();
	
	// 회원수정페이지에 접속한 회원정보를 불러오는 메서드
	MemberVO getEditMemberInfo(String userId) throws Exception;
	
	// 회원수정페이지에서 수정된 회원정보를 저장하는 메서드
	boolean saveEditInfo(MemberDTO editMember) throws Exception;
	
	// 로그인 시키는 메서드
	MemberVO loginMember(String userId, String userPwd) throws Exception;
	

	

  public ResponseEntity<Integer> sendOne(String phone) throws Exception;

  

}
