package com.tn.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tn.admin.dao.MemberAdminDAO;
import com.tn.admin.model.vo.MemberAgeVO;
import com.tn.admin.model.vo.MemberClassVO;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.admin.model.vo.VisitHistory;
import com.tn.member.model.vo.MemberVO;
import com.tn.order.model.vo.OrderVO;

@Service
public class MemberAdminServiceImpl implements MemberAdminService {

	@Autowired
	MemberAdminDAO dao;

	@Override
	public Map<String, Object> getAllMember(PagingInfoDTO pDTO, SearchCriteriaDTO searchCriteria, String sortBy) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<MemberVO> list = null;
		PagingInfo pi = makePagingInfo(pDTO, searchCriteria);
		
		if (searchCriteria.getSearchType() == null || searchCriteria.getSearchWord() == null || 
				searchCriteria.getSearchType() == "" || searchCriteria.getSearchWord() == "") {
			//list = dao.getMemberList2 (pi,sortBy);
			if(sortBy.equals("default")) {
				list = dao.getMemberList1(pi);
//				System.out.println("검색조건X, 검색어X, sortby default 일때");
			} else {
				list = dao.getMemberList2(pi,sortBy);
//				System.out.println("검색조건X, 검색어X, sortby 있을 때");
			}
						
		} else {
			if(sortBy.equals("default")) {
				list = dao.selectAllBoard(pi, searchCriteria);
//				System.out.println("sortby default 일때");
			} else {
				list = dao.selectAllBoard(pi, searchCriteria, sortBy);
//				System.out.println("sortby 가 있을때");
			}
		}
		
//		System.out.println("MemberAdminService : pi =>" + pi.toString() );
//		System.out.println("MemberAdminService : list =>" + list.toString() );
		resultMap.put("pagingInfo", pi);
		resultMap.put("memberList", list);

		return resultMap;
	}

	private PagingInfo makePagingInfo(PagingInfoDTO dto, SearchCriteriaDTO sc) throws Exception {
		PagingInfo pi = new PagingInfo(dto);
		
		// 검색어가 없을 때는 전체 데이터 수를 얻어오는 것 부터 페이징 시작
		if(sc.getSearchType() == null || sc.getSearchWord() == null || 
				sc.getSearchType() == "" || sc.getSearchWord() == "") {
			// 검색어가 있을 때는 검색한 글의 데이터 수를 얻어오는 것부터 페이징 시작
			pi.setTotalPostCnt(dao.getTotalPostCnt());	
		} else { 
			pi.setTotalPostCnt(dao.getTotalPostCnt(sc)); 	
//			System.out.println(dao.getTotalPostCnt(sc));
		}
			
		pi.setTotalPageCnt();		
		pi.setStartRowIndex();				
		
		//페이징 블럭 만들기
		pi.setPageBlockNoCurPage();
		pi.setStartPageNoCurBlock();
		pi.setEndPageNoCurBlock();
		
		
		return pi;
	}

	@Override
	public MemberVO getMemberInfo(String userId) throws Exception {
		
		return dao.getMemberInfo(userId);
	}

	@Override
	public List<OrderVO> getRecentOrder(String userId) throws Exception {

		return dao.getRecentOrder(userId);
	}

	
	
	@Override
	@Transactional(readOnly = true)
	public Map<String, Object> getVisitorHistory() throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<VisitHistory> visitHistory = dao.selectVisitHistory();
		List<MemberAgeVO> memberAge = dao.selectMemberAge();
		List<MemberClassVO> memberClass = dao.selectMemberClass();
		
//		System.out.println(memberAgeMap);
		
		resultMap.put("visitHistory", visitHistory);
		resultMap.put("memberAge", memberAge);
		resultMap.put("memberClass", memberClass);
		
		
		
		
		return resultMap;
	}
	

}
