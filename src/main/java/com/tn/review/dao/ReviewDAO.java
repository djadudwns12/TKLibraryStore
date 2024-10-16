package com.tn.review.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tn.review.model.DTO.ReviewDTO;

@Repository
public interface ReviewDAO {
	
	// bookNo번 책의 리뷰를 가져오기 위한 메소드
	List<ReviewDTO> getReview(int bookNo) throws Exception;
}
