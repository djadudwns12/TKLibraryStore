package com.tn.member.dao;

import java.util.List;
import java.util.Map;

import com.tn.member.model.vo.MemberVO;

public interface MemberDAO {

	List<Map<String, String>> getMember();
	
	// ȸ������������ ���� ȸ�������� �ҷ����� �޼���
	MemberVO getEditMemberInfo(String userId) throws Exception;
	
	// ������ ȸ�������� ������Ʈ�ϴ� �޼���
	int updateEditMember(MemberVO editMember) throws Exception;
	
	
	
}
