package com.tn.member.service;

import java.util.List;
import java.util.Map;

import com.tn.member.model.dto.MemberDTO;
import com.tn.member.model.dto.RegisterDTO;

import org.springframework.http.ResponseEntity;

import com.tn.member.model.vo.ImgFileVODTO;
import com.tn.member.model.vo.MemberVO;

public interface MemberService {

	List<Map<String, String>> getMember();
	
	// ȸ������������ ���� ȸ�������� �ҷ����� �޼���
	MemberVO getEditMemberInfo(String userId) throws Exception;
	
	// ������ ȸ�������� ������Ʈ�ϴ� �޼���
	boolean saveEditInfo(MemberDTO editMember) throws Exception;
	// 로그인 시키는 메서드
	MemberVO loginMember(String userId, String userPwd) throws Exception;
  
  public ResponseEntity<Integer> sendOne(String phone) throws Exception;

//-----------------------------------------박근영-------------------------------------------------
	// 회원정보 저장 메서드
	boolean registerMember(RegisterDTO registerDTO, ImgFileVODTO fileInfo) throws Exception;
	// 중복아이디 비교 메서드
	boolean compareId(String tmpUserId) throws Exception;
//-----------------------------------------박근영-------------------------------------------------



}
