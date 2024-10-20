package com.tn.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.member.model.vo.MemberVO;
import com.tn.order.model.vo.OrderVO;

@Service
public interface MemberAdminService {

	// 관리자페이지-회원관리페이지에서 회원목록를 불러오는 메서드(페이징, 검색)
	Map<String, Object> getAllMember(PagingInfoDTO pDTO, SearchCriteriaDTO searchCriteria, String sortBy) throws Exception;

	// 관리자페이지-회원관리페이지에서 회원정보를 불러오는 메서드
	MemberVO getMemberInfo(String userId) throws Exception;

	// 관리자페이지-회원관리페이지에서 최근 주문내역을 불러오는 메서드
	List<OrderVO> getRecentOrder(String userId) throws Exception;

	// 회원정보를 삭제하는 메서드
	boolean removeMemberInfo(String deletedMember) throws Exception;

	// 관리자페이지-탈퇴한회원 목록을 불러오는 메서드
	Map<String, Object> getUnregiMember(PagingInfoDTO pDTO, SearchCriteriaDTO searchCriteria, String sortBy) throws Exception;
	Map<String, Object> getVisitorHistory() throws Exception;

	boolean removeImg(String imgPath);

	// 탈퇴요청 후 30일이 지난 회원 목록을 가져오는 메서드
	List<String> findExpiredMember() throws Exception;


}
