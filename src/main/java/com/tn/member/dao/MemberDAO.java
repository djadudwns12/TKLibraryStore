package com.tn.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tn.member.model.dto.MemberDTO;
import com.tn.member.model.dto.RegisterDTO;
import com.tn.member.model.vo.ImgFileVODTO;
import com.tn.member.model.vo.MemberVO;

@Repository
public interface MemberDAO {
	
	public List<Map<String, String>> getMember();
	
	public MemberVO getMember(String userId, String userPwd) throws Exception;
//=============================최미설========================================//
	// 회원수정페이지에 접속한 회원정보를 불러오는 메서드
	MemberVO getEditMemberInfo(String userId) throws Exception;
	
	// 회원수정페이지에서 수정된 회원정보를 저장하는 메서드
	int updateEditMember(MemberVO editMember) throws Exception;
	
	// 회원수정페이지에서 수정된 이미지를 저장하는 메서드
	int saveEditImg(ImgFileVODTO fileInfo, String userId) throws Exception;
	
	// 비밀번호를 변경하는 메서드
	int saveEditPwd(String userPwd, String userId) throws Exception;
	
	// 회원탈퇴
	int deleteMember(String userId) throws Exception;
//=============================최미설========================================//
	
//-----------------------------------------박근영-------------------------------------------------
	// 회원정보 INSERT(가입시)
	public int insertMember(RegisterDTO registerDTO, ImgFileVODTO fileInfo) throws Exception;
	// 회원주소 INSERT(가입시)
	public int insertAddress(RegisterDTO registerDTO, String address);
	
	// ID 중복확인 SELECT
	public int selectId(String tmpUserId) throws Exception;
//-----------------------------------------박근영-------------------------------------------------








}
