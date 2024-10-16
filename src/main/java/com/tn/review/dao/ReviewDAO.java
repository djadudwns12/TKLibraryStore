package com.tn.review.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tn.review.model.DTO.ReviewDTO;
import com.tn.review.model.VO.ReviewVO;

@Repository
public interface ReviewDAO {
	
	// ----------------- 김가윤 -----------------
	
	// bookNo번 책의 리뷰를 가져오기 위한 메소드
	List<ReviewVO> getReview(int bookNo) throws Exception;

	int insertReview(ReviewDTO reviewDTO) throws Exception;
}
