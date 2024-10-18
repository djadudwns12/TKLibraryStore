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

	// ===================================== 최미설
	// =====================================//
	@Override
	public List<ReviewVO> getRecentReviewForAdmin(String userId) throws Exception {

		return ses.selectList(NS + ".getRecentReviewForAdmin", userId);
	}

	@Override
	public int removeUndefinedReview(String deletedMember) throws Exception {

		return ses.delete(NS + ".removeUndefinedReview", deletedMember);
	}

	// ===================================== 최미설
	// =====================================//

	@Override
	public int insertReview(ReviewDTO reviewDTO) throws Exception {

		return ses.insert(NS + ".insertReviewDTO", reviewDTO);
	}

	@Override
	public List<ReviewDTO> getReview(int bookNo) throws Exception {

		return ses.selectList(NS + ".getReviewWithBookNo", bookNo);
	}

	@Override
	public int updateReview(ReviewDTO reviewDTO) throws Exception {
		
		return ses.update(NS + ".updateReview", reviewDTO);
	}

	@Override
	public int deleteReview(int reviewNo) throws Exception {
		
		return ses.delete(NS + ".deleteReview", reviewNo);
	}

	@Override
	public int reviewCnt(int bookNo) throws Exception {
		
		return ses.selectOne(NS + ".reviewCnt", bookNo);
	}

	@Override
	public int getAverage(int bookNo) throws Exception {
		
		return ses.selectOne(NS + ".getAverageReviewScore", bookNo);
	}

}
