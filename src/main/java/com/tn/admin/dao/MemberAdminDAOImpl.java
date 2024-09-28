package com.tn.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.member.model.vo.MemberVO;

@Repository
public class MemberAdminDAOImpl implements MemberAdminDAO {

	@Autowired
	private SqlSession ses;
	
	private String NS = "com.tn.mapper.MemberAdminMapper";

	@Override
	public List<MemberVO> getMemberList(PagingInfo pi, String sortBy) throws Exception {
		System.out.println("MemberAdminDAO : "+ pi.toString() );
		System.out.println("MemberAdminDAO : "+ sortBy.toString());
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sortBy", sortBy);
		params.put("startRowIndex",pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		
		return ses.selectList(NS + ".getMemberSorted", params);
	}

	@Override
	public int getTotalPostCnt() {
		return ses.selectOne(NS + ".selectTotalCount");
	}

	@Override
	public int getTotalPostCnt(SearchCriteriaDTO sc) {
		SearchCriteriaDTO sc2 = new SearchCriteriaDTO(sc.getSearchType(),"%" + sc.getSearchWord() + "%");
		return ses.selectOne(NS + ".selectTotalCountWithSearchCriteria", sc2);
	}

	/*
	 * @Override public List<MemberVO> getMemberList(PagingInfo pi) { Map<String,
	 * Object> params = new HashMap<String, Object>();
	 * params.put("startRowIndex",pi.getStartRowIndex());
	 * params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
	 * 
	 * return ses.selectList(NS + ".getMemberSorted",params); }
	 */

	@Override
	public List<MemberVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchType", searchCriteria.getSearchType());
		params.put("searchWord", "%" +searchCriteria.getSearchWord()+ "%");
		params.put("startRowIndex",pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		
		return ses.selectList(NS + ".getSearchedMemberPaged", params);
	}
	@Override
	public List<MemberVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy) {
		Map<String, Object> params = new HashMap<String, Object>();
		System.out.println("다오까진 잘 옴-=============");
		params.put("sortBy", sortBy);
		params.put("startRowIndex",pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		params.put("searchType", searchCriteria.getSearchType());
		params.put("searchWord", "%" + searchCriteria.getSearchWord() + "%");
		
		return ses.selectList(NS + ".getMemberSearchedSorted",params);
		
	}

	


}
