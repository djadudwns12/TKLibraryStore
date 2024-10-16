package com.tn.review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tn.member.model.vo.MemberVO;
import com.tn.review.model.DTO.ReviewDTO;
import com.tn.review.service.ReviewService;


@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService rService;


	@PostMapping(value="/insertReview", produces = "application/text; charset=UTF-8;")
	public ResponseEntity<String> insertReview(@RequestBody ReviewDTO reviewDTO, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		System.out.println("리뷰 작성한 유저 아이디 : " + loginMember.getUserId());
		
		reviewDTO.setReviewWriter(loginMember.getUserId());
		
		try {
			rService.insertReview(reviewDTO);
			System.out.println("작성한 리뷰 내용 : " + reviewDTO.toString());
			
			return ResponseEntity.ok("리뷰 저장");
		} catch (Exception e) {
			e.printStackTrace();
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("저장 실패");
		}
	}
} 
