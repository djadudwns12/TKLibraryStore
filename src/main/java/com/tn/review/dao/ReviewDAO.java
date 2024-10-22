package com.tn.review.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tn.member.model.dto.MemberDTO;
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
	List<ReviewVO> getReview(int bookNo) throws Exception;
  // 새 리뷰와 별점을 입력하는 메서드
	int insertReview(ReviewDTO reviewDTO) throws Exception;

	
	
	//--------------------- 이아림(start) ---------------------------- 
	
	// 로그인 한 회원의 마이페이지에 '내 리뷰'를 가져오는 메서드
	List<ReviewVO> getMyReview(MemberDTO loginMember) throws Exception;

	List<ReviewVO> getMyReviewById(String userId) throws Exception;
	
	//--------------------- 이아림(end) ---------------------------- 
}
