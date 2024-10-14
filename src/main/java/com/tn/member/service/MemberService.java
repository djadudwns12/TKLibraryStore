package com.tn.member.service;

import java.util.List;
import java.util.Map;

import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.member.model.dto.MemberDTO;

import com.tn.member.model.dto.RegisterDTO;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.tn.member.model.vo.ImgFileVODTO;
import com.tn.member.model.vo.MemberVO;
import com.tn.member.model.vo.PointLogVO;

@Service
public interface MemberService {

	List<Map<String, String>> getMember();
	
	// 회원수정페이지에 접속한 회원정보를 불러오는 메서드
	MemberVO getEditMemberInfo(String userId) throws Exception;
	
	// 회원수정페이지에서 수정된 회원정보를 저장하는 메서드
	boolean saveEditInfo(MemberDTO editMember) throws Exception;
	
	// 로그인 시키는 메서드
	MemberVO loginMember(String userId, String userPwd) throws Exception;
	
	// 회원탈퇴
	boolean deleteMember(String userId) throws Exception;
	

  public ResponseEntity<Integer> sendOne(String phone) throws Exception;


//-----------------------------------------박근영-------------------------------------------------
	// 회원정보 저장 메서드
	boolean registerMember(RegisterDTO registerDTO, ImgFileVODTO fileInfo) throws Exception;
	// 중복아이디 비교 메서드
	boolean compareId(String tmpUserId) throws Exception;
//-----------------------------------------박근영-------------------------------------------------

	
//-----------------------------------------엄영준------------------------------------------------- 	
	boolean addVisitHistory() throws Exception;
	
	
	List<PointLogVO> getPointLog(MemberDTO loginMember) throws Exception;
//-----------------------------------------엄영준------------------------------------------------- 	




}
