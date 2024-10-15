package com.tn.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tn.booklist.model.dto.PagingInfo;
import com.tn.booklist.model.dto.PagingInfoDTO;
import com.tn.review.dao.ReviewDAO;
import com.tn.review.model.DTO.ReviewDTO;
import com.tn.review.model.VO.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reviewDao;

	// ---------------------------------------------- 김가윤 ---------------------------------------------- 

	@Override
	public List<ReviewDTO> getBookNoReview(int bookNo) throws Exception {
		
		System.out.println("ReviewServiceImpl 리뷰 가져오기 : " + bookNo + "번 글");
		
		List<ReviewDTO> list = reviewDao.getReview(bookNo);
		
		return list;
	}
	

}
