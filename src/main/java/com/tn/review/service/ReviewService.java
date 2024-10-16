package com.tn.review.service;

import java.util.List;

import com.tn.review.model.DTO.ReviewDTO;
import com.tn.review.model.VO.ReviewVO;

public interface ReviewService {
	
	List<ReviewVO> getRecentReview(String userId) throws Exception;
	
	// ---------------------------------------------- 김가윤 ---------------------------------------------- 
	
	// bookNo번 책의 리뷰를 가져오는 메소드
	List<ReviewDTO> getBookNoReview(int bookNo) throws Exception;

	

}
