package com.tn.member.service;

import java.util.List;
import java.util.Map;

import com.tn.member.model.dto.MemberDTO;
import com.tn.member.model.vo.MemberVO;

public interface MemberService {

	List<Map<String, String>> getMember();
	
	// ȸ������������ ���� ȸ�������� �ҷ����� �޼���
	MemberVO getEditMemberInfo(String userId) throws Exception;
	
	// ������ ȸ�������� ������Ʈ�ϴ� �޼���
	boolean saveEditInfo(MemberDTO editMember) throws Exception;
}
