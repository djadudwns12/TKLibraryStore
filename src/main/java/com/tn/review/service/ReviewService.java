package com.tn.review.service;

import java.util.List;

import com.tn.review.model.DTO.ReviewDTO;
import com.tn.review.model.VO.ReviewVO;

public interface ReviewService {
// ===================================== 최미설 =====================================//	
	// 최근 리뷰 5개를 불러오는 메서드
	List<ReviewVO> getRecentReviewForAdmin(String userId) throws Exception;
	
	// 탈퇴한 회원의 리뷰를 삭제하는 메서드
	boolean removeUndefinedReview(String deletedMember) throws Exception;
	
	
// ===================================== 최미설 =====================================//	
	// 새 리뷰와 별점을 작성, 저장하는 메서드
	boolean saveBoard(ReviewDTO reviewDTO);

	
	List<ReviewVO> getRecentReview(String userId) throws Exception;
	
	// ---------------------------------------------- 김가윤 ---------------------------------------------- 
	
	// bookNo번 책의 리뷰를 가져오는 메소드
	List<ReviewVO> getBookNoReview(int bookNo) throws Exception;

	boolean insertReview(ReviewDTO reviewDTO) throws Exception;

	



}
