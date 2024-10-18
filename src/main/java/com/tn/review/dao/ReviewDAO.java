package com.tn.review.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tn.review.model.DTO.ReviewDTO;
import com.tn.review.model.VO.ReviewVO;

@Repository
public interface ReviewDAO {
	// ===================================== 최미설 =====================================//		
	// 최근 리뷰 5개를 불러오는 메서드
	List<ReviewVO> getRecentReviewForAdmin(String userId) throws Exception;
	
	// 탈퇴한 회원의 리뷰를 지우는 메서드
	int removeUndefinedReview(String deletedMember) throws Exception;	
	// ===================================== 최미설 =====================================//		
	
	


	
	// ----------------- 김가윤 -----------------
	
	// bookNo번 책의 리뷰를 가져오기 위한 메소드
	List<ReviewDTO> getReview(int bookNo) throws Exception;
	// 새 리뷰와 별점을 입력하는 메서드
	int insertReview(ReviewDTO reviewDTO) throws Exception;

	int updateReview(ReviewDTO reviewDTO) throws Exception;

	int deleteReview(int reviewNo) throws Exception;

	int reviewCnt(int bookNo) throws Exception;

	int getAverage(int bookNo) throws Exception;
}
