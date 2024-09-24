package com.tn.qa.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
}
