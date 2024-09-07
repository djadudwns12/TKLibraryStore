package com.tn.member.service;

import java.util.List;
import java.util.Map;

import com.tn.member.model.vo.MemberVO;

public interface MemberService {

	List<Map<String, String>> getMember();
	
	// ȸ������������ ���� ȸ�������� �ҷ����� �޼���
	MemberVO getEditMemberInfo(String userId) throws Exception;
}
