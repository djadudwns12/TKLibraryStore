package com.tn.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.member.model.vo.MemberVO;

@Repository
public interface MemberAdminDAO {

	// 페이징된 회원목록을 불러오는 메서드
//	List<MemberVO> getMemberList(PagingInfo pi);
	
	// 관리자페이지-회원관리페이지에서 회원목록을 불러오는 메서드(페이징, 검색)
	List<MemberVO> getMemberList(PagingInfo pi, String sortBy) throws Exception;

	// (검색어가 없을 때)게시글의 총 갯수를 가져오는 메서드
	int getTotalPostCnt();
	
	// 검색어가 있을 때, 검색결과의 총 갯수를 가져오는 메서드
	int getTotalPostCnt(SearchCriteriaDTO sc);
	
	// 검색어만 있을 때 목록 
	List<MemberVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria);

	// 검색했을 때 정렬기준 설정
	List<MemberVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy);

	
}
