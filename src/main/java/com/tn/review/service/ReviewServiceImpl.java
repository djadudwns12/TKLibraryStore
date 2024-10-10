package com.tn.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tn.review.dao.ReviewDAO;
import com.tn.review.model.VO.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO dao;
	
	@Override
	public List<ReviewVO> getRecentReview(String userId) {
		
		return dao.getRecentReview(userId);
	}

}
