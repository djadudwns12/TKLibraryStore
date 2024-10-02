package com.tn.review.service;

import java.util.List;

import com.tn.review.model.VO.ReviewVO;

public interface ReviewService {

	// 최근 리뷰 5개를 불러오는 메서드
	List<ReviewVO> getRecentReview(String userId);

}
