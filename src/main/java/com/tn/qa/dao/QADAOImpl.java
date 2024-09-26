package com.tn.qa.dao;

import java.util.List;

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
	public List<QAVO> selectQAList(String userId) {
		// TODO Auto-generated method stub
		return sess.selectList(NS+".selectQAList", userId);
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
		return sess.selectOne(NS+".selectSearchAllQAListCnt");
	}

	
	// 구현해야할 코드
	@Override
	public List<QAVO> selectAllQAList(PagingInfo pi) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QAVO> selectAllQAList(PagingInfo pi, String sortBy) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QAVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QAVO> selectAllBoard(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
