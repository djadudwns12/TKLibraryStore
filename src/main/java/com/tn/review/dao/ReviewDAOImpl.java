package com.tn.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.review.model.DTO.ReviewDTO;
import com.tn.review.model.VO.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSession ses;
	private static String NS = "com.tn.mapper.ReviewMapper";
	
	// ===================================== 최미설 =====================================//		
	@Override
	public List<ReviewVO> getRecentReviewForAdmin(String userId) throws Exception {
		
		return ses.selectList(NS + ".getRecentReviewForAdmin", userId);
	}
	
	@Override
	public int removeUndefinedReview(String deletedMember) throws Exception {
		
		return ses.delete(NS + ".removeUndefinedReview", deletedMember); 
	}
	
	// ===================================== 최미설 =====================================//		

	@Override
	public int insertNewReview(ReviewDTO reviewDTO) {
		
		return ses.insert(NS + ".insertNewReview", reviewDTO);
	}



}
