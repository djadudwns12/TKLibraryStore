package com.tn.member.dao;

import java.util.List;
import java.util.Map;


import com.tn.member.model.dto.MemberDTO;
import com.tn.member.model.dto.RegisterDTO;
import com.tn.member.model.vo.ImgFileVODTO;
import com.tn.member.model.vo.MemberVO;

public interface MemberDAO {
	
	public List<Map<String, String>> getMember();
	
	public MemberVO getMember(String userId, String userPwd) throws Exception;
  // ȸ������������ ���� ȸ�������� �ҷ����� �޼���
	MemberVO getEditMemberInfo(String userId) throws Exception;
	
	// ������ ȸ�������� ������Ʈ�ϴ� �޼���
	int updateEditMember(MemberDTO editMember) throws Exception;

//-----------------------------------------박근영-------------------------------------------------
	// 회원정보 insert(가입)
	public int insertMember(RegisterDTO registerDTO, ImgFileVODTO fileInfo);
//-----------------------------------------박근영-------------------------------------------------
}
