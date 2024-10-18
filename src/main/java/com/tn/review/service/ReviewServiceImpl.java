package com.tn.review.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tn.review.dao.ReviewDAO;
import com.tn.review.model.DTO.ReviewDTO;
import com.tn.review.model.VO.ReviewVO;


@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
  ReviewDAO reviewDao;

	// ===================================== 최미설 =====================================//		
	@Override
	public List<ReviewVO> getRecentReviewForAdmin(String userId) throws Exception {
		
		return reviewDao.getRecentReviewForAdmin(userId);
	}
	
		@Override
	public boolean removeUndefinedReview(String deletedMember) throws Exception {
		boolean result = false;
		if(reviewDao.removeUndefinedReview(deletedMember) == 1) {
			result = true;
		}
		return result;
	}
		
	// ===================================== 최미설 =====================================//	
	
	
	// ---------------------------------------------- 최미설 ---------------------------------------------- 
	
	@Override
	public List<ReviewVO> getRecentReview(String userId) throws Exception {
		
		return null;
	}
	

	// ---------------------------------------------- 김가윤 ---------------------------------------------- 

	@Override
	public List<ReviewDTO> getBookNoReview(int bookNo) throws Exception {
		
		List<ReviewDTO> list = reviewDao.getReview(bookNo);
		
		return list;
	}
	@Override
	public boolean insertReview(ReviewDTO reviewDTO) throws Exception {
		
		boolean result = false;
		
		if(reviewDao.insertReview(reviewDTO) == 1) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}

	@Override
	public boolean updateReview(ReviewDTO reviewDTO) throws Exception {
		
		boolean result = false;
		
		if(reviewDao.updateReview(reviewDTO) == 1) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}

	@Override
	public boolean deleteReview(int reviewNo) throws Exception {
		
		boolean result = false;
		
		if(reviewDao.deleteReview(reviewNo) == 1) {
			result = true;
		} else {
			result = false;
		}
		return result;
	}

	@Override
	public int reviewCnt(int bookNo) throws Exception {
		
		return reviewDao.reviewCnt(bookNo);
	}

	@Override
	public int getAvergaeScore(int bookNo) throws Exception {
		
		return reviewDao.getAverage(bookNo);
	}

	

}
