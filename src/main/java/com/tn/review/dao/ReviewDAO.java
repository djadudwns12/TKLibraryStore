package com.tn.review.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tn.review.model.DTO.ReviewDTO;
import com.tn.review.model.VO.ReviewVO;

@Repository
public interface ReviewDAO {

	// 최근 리뷰 5개를 불러오는 메서드
	List<ReviewVO> getRecentReview(String userId);
	
	// 새 리뷰와 별점을 입력하는 메서드
	int insertNewReview(ReviewDTO reviewDTO);

	// 김가윤
	
	// bookNo번 책의 리뷰를 가져오기 위한 메소드
	List<ReviewDTO> getReview(int bookNo) throws Exception;
}
