package com.tn.review.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tn.review.model.VO.ReviewVO;

@Repository
public interface ReviewDAO {

	// 최근 리뷰 5개를 불러오는 메서드
	List<ReviewVO> getRecentReview(String userId);

}