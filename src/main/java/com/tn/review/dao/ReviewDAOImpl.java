package com.tn.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.review.model.VO.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSession ses;
	private static String NS = "com.tn.mapper.ReviewMapper";
	
	@Override
	public List<ReviewVO> getRecentReview(String userId) {
		
		return ses.selectList(NS + ".getRecentReview", userId);
	}

}
