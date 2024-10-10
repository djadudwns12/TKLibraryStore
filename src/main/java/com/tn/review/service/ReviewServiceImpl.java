package com.tn.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tn.review.dao.ReviewDAO;
import com.tn.review.model.DTO.ReviewDTO;
import com.tn.review.model.VO.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO dao;

	
	@Override
	public List<ReviewVO> getRecentReview(String userId) {
		
		return dao.getRecentReview(userId);
	}
	

	@Override
	@Transactional
	public boolean saveBoard(ReviewDTO reviewDTO) {
		
		boolean result = false;
		
		if (dao.insertNewReview(reviewDTO) == 1) {
			result = true;
		}
		
		return result;
	}
	

}
