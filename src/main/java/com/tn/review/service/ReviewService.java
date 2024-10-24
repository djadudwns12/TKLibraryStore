package com.tn.review.service;

import java.util.List;

import com.tn.member.model.dto.MemberDTO;
import com.tn.review.model.DTO.ReviewDTO;
import com.tn.review.model.VO.ReviewVO;

public interface ReviewService {
// ===================================== 최미설 =====================================//	
	// 최근 리뷰 5개를 불러오는 메서드
	List<ReviewVO> getRecentReviewForAdmin(String userId) throws Exception;
	
	// 탈퇴한 회원의 리뷰를 삭제하는 메서드
	boolean removeUndefinedReview(String deletedMember) throws Exception;
	
	
// ===================================== 최미설 =====================================//	

	
	List<ReviewVO> getRecentReview(String userId) throws Exception;
	
	// ---------------------------------------------- 김가윤 ---------------------------------------------- 
	
	// bookNo번 책의 리뷰를 가져오는 메소드
	List<ReviewDTO> getBookNoReview(int bookNo) throws Exception;

	boolean insertReview(ReviewDTO reviewDTO) throws Exception;

	boolean updateReview(ReviewDTO reviewDTO) throws Exception;

	boolean deleteReview(int reviewNo) throws Exception;

	int reviewCnt(int bookNo) throws Exception;

	int getAvergaeScore(int bookNo) throws Exception;

	
	// ---------------------------------------------- 이아림(start) ----------------------------------------------
	
	// userId로 내가 쓴 리뷰를 가져오는 메서드
	List<ReviewVO> getMyReview(MemberDTO loginMember) throws Exception;

	// userId로 내가 쓴 리뷰를 가져오는 메서드 
	List<ReviewVO> getMyReviewList(String userId) throws Exception;
	
	// ---------------------------------------------- 이아림(end) ----------------------------------------------

	



}
