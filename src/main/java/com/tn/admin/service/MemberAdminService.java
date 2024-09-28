package com.tn.admin.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.SearchCriteriaDTO;

@Service
public interface MemberAdminService {

	// 관리자페이지-회원관리페이지에서 회원정보를 불러오는 메서드(페이징, 검색)
	Map<String, Object> getAllMember(PagingInfoDTO pDTO, SearchCriteriaDTO searchCriteria, String sortBy) throws Exception;
}
