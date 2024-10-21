package com.tn.qa.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.qa.model.vo.QAVO;
@Repository
public class QADAOImpl implements QADAO {

	@Autowired
	private SqlSession sess;
	
	private final String NS = "com.tn.mapper.QAMapper";
	
	@Override
	public List<QAVO> selectByUserIdQAList(String userId) {
		// TODO Auto-generated method stub
		return sess.selectList(NS+".selectByUserIdQAList", userId);
	}

	@Override
	public QAVO selectQADetail(int qNo) throws Exception {
		// TODO Auto-generated method stub
		return sess.selectOne(NS+".selectQADetail", qNo);
	}
	@Override
	public int getTotalPostCnt() throws Exception {
		// TODO Auto-generated method stub
		return sess.selectOne(NS+".selectAllQAListCnt");
	}
	
	@Override
	public int getTotalPostCnt(SearchCriteriaDTO sc) {
		return sess.selectOne(NS+".selectSearchAllQAListCnt",sc);
	}
	// 구현해야할 코드---------------------------------------------------------------------------------------------
	@Override
	public List<QAVO> selectAllQAList(PagingInfo pi) throws Exception {
		
		return sess.selectList(NS+".selectAllQAList", pi);
	}

	@Override
	public List<QAVO> selectAllQAList(PagingInfo pi, String sortBy) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("sortBy", sortBy);
		params.put("startRowIndex",pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		
		return sess.selectList(NS+".sortByselectQAList", params);
	}

	@Override
	public List<QAVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria) {
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("startRowIndex",pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		params.put("searchType", searchCriteria.getSearchType());
		params.put("searchWord", "%" +searchCriteria.getSearchWord()+ "%");
		
		return sess.selectList(NS+".searchCriteriaselectQAList", params);
	}

	@Override
	public List<QAVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRowIndex",pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		params.put("sortBy", sortBy);
		params.put("searchType", searchCriteria.getSearchType());
		params.put("searchWord", "%" +searchCriteria.getSearchWord()+ "%");
		
		return sess.selectList(NS+".searchCriteriasortByselectQAList", params);
	}
	
	// 구현해야할 코드---------------------------------------------------------------------------------------------

	@Override
	public int insertQA(QAVO qa) {
		
		return sess.insert(NS+".insertQA", qa);
	}

	@Override
	public int saveQaAnswer(QAVO qa) {
		// TODO Auto-generated method stub
		return sess.update(NS+".saveQaAnswer", qa);
	}
// ====================================== 최미설 ===================================================== //
	@Override
	public int removeUndefinedQA(String deletedMember) throws Exception {
		return sess.delete(NS+ ".removeUndefinedQA" ,deletedMember);
	}
// ====================================== 최미설 ===================================================== //
}
