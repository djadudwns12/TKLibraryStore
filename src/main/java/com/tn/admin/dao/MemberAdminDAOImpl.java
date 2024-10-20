package com.tn.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.admin.model.vo.MemberAgeVO;
import com.tn.admin.model.vo.MemberClassVO;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.admin.model.vo.VisitHistory;
import com.tn.member.model.dto.MemberDTO;
import com.tn.member.model.vo.MemberVO;
import com.tn.order.model.vo.OrderVO;

@Repository
public class MemberAdminDAOImpl implements MemberAdminDAO {

	@Autowired
	private SqlSession ses;

	private String NS = "com.tn.mapper.MemberAdminMapper";

	@Override
	public List<MemberVO> getMemberList2(PagingInfo pi, String sortBy) throws Exception {
//		System.out.println("MemberAdminDAO : " + pi.toString());
//		System.out.println("MemberAdminDAO : " + sortBy.toString());

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sortBy", sortBy);
		params.put("startRowIndex", pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());

		return ses.selectList(NS + ".getMemberSorted", params);
	}

	@Override
	public int getTotalPostCnt() throws Exception {
//		System.out.println(">> MemberAdminDAO(getTotalPostCnt1)");
		return ses.selectOne(NS + ".selectTotalCount");
	}

	@Override
	public int getTotalPostCnt(SearchCriteriaDTO sc) throws Exception {
//		System.out.println(">> MemberAdminDAO(getTotalPostCnt2)");
		SearchCriteriaDTO sc2 = new SearchCriteriaDTO(sc.getSearchType(), "%" + sc.getSearchWord() + "%");
		return ses.selectOne(NS + ".selectTotalCountWithSearchCriteria", sc2);
	}


	 @Override public List<MemberVO> getMemberList1 (PagingInfo pi) { 
//	 System.out.println(">> MemberAdminDAO(getMemberList)");
	 Map<String, Object> params = new HashMap<String, Object>();
	 params.put("startRowIndex",pi.getStartRowIndex());
	 params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());

	 return ses.selectList(NS + ".getMember",params); 
	 }
	 

	@Override
	public List<MemberVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria) throws Exception {
//		System.out.println(">> MemberAdminDAO(SelectAllBoard)");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchType", searchCriteria.getSearchType());
		params.put("searchWord", "%" + searchCriteria.getSearchWord() + "%");
		params.put("startRowIndex", pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		System.out.println("MemberAdminDAO(SelectAllBoard) : " + params);
		return ses.selectList(NS + ".getSearchedMemberPaged", params);
	}

	@Override
	public List<MemberVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy)
			throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
//		System.out.println(">> MemberAdminDAO(selectAllBoard)");
		params.put("sortBy", sortBy);
		params.put("startRowIndex", pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		params.put("searchType", searchCriteria.getSearchType());
		params.put("searchWord", "%" + searchCriteria.getSearchWord() + "%");

		return ses.selectList(NS + ".getMemberSearchedSorted", params);

	}

	@Override
	public MemberVO getMemberInfo(String userId) throws Exception {
		
		return ses.selectOne(NS + ".getMemberInfo", userId);
	}

	@Override
	public List<OrderVO> getRecentOrder(String userId) throws Exception {

		return ses.selectList(NS + ".getRecentOrder", userId);
	}
	
	@Override
	public List<VisitHistory> selectVisitHistory() {
		// TODO Auto-generated method stub
		return ses.selectList(NS+".selectVisitHistory");
	}

	@Override
	public List<MemberAgeVO> selectMemberAge() throws Exception {
		// TODO Auto-generated method stub
		return ses.selectList(NS+".selectMemberAge");
	}

	@Override
	public List<MemberClassVO> selectMemberClass() throws Exception {
		// TODO Auto-generated method stub
		return ses.selectList(NS+".selectMemberClass");
	}

	

	@Override
	public int removeMemberInfo(String deletedMember) throws Exception {
		
		return ses.delete(NS + ".removeDeletedMember", deletedMember);
	}
	
// -----------------------------------탈퇴회원처리-------------------------------------------//
	@Override
	public List<MemberVO> getUnregiMemberList1(PagingInfo pi) throws Exception {
		 Map<String, Object> params = new HashMap<String, Object>();
		 params.put("startRowIndex",pi.getStartRowIndex());
		 params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());

		 return ses.selectList(NS + ".getUnregiMember",params); 
	}

	@Override
	public List<MemberVO> getUnregiMemberList2(PagingInfo pi, String sortBy) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sortBy", sortBy);
		params.put("startRowIndex", pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());

		return ses.selectList(NS + ".getUnregiMemberSorted", params);
	}

	@Override
	public int getTotalPostCntForUR() throws Exception {
		return ses.selectOne(NS + ".selectUnregiTotalCount");
	}

	@Override
	public int getTotalPostCntForUR(SearchCriteriaDTO sc) throws Exception {
		SearchCriteriaDTO sc2 = new SearchCriteriaDTO(sc.getSearchType(), "%" + sc.getSearchWord() + "%");
		return ses.selectOne(NS + ".selectTotalCountWithSearchCriteriaForUR", sc2);
	}

	@Override
	public List<MemberVO> selectUnregiBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchType", searchCriteria.getSearchType());
		params.put("searchWord", "%" + searchCriteria.getSearchWord() + "%");
		params.put("startRowIndex", pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		System.out.println("MemberAdminDAO(SelectAllBoard) : " + params);
		return ses.selectList(NS + ".getSearchedUnregiMemberPaged", params);
	}

	@Override
	public List<MemberVO> selectUnregiBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy)
			throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
//		System.out.println(">> MemberAdminDAO(selectAllBoard)");
		params.put("sortBy", sortBy);
		params.put("startRowIndex", pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		params.put("searchType", searchCriteria.getSearchType());
		params.put("searchWord", "%" + searchCriteria.getSearchWord() + "%");

		return ses.selectList(NS + ".getUnregiMemberSearchedSorted", params);
	}

	@Override
	public List<String> findExpiredMember() throws Exception {
		return ses.selectList(NS + ".findExpiredMember");
	}

	@Override
	public void deleteUnregister(String deleteId) throws Exception {
		ses.delete(NS + ".deleteUnregister", deleteId);
	}

	// 더미데이터 만들기
//	@Override
//	public int insertDummyMember(MemberDTO dto) throws Exception {
//
//		return ses.insert(NS + ".insertDummyMember", dto);
//	}

}
