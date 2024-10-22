package com.tn.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			
			String redirectUrl = "/bookList/bookDetail?bookNo=" + reviewDTO.getBookNo();
			
			return ResponseEntity.ok(redirectUrl);
		} catch (Exception e) {
			e.printStackTrace();
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("저장 실패");
		}
	}
	
	@PostMapping(value="/modifyReview", produces = "application/text; charset=UTF-8;")
	public ResponseEntity<String> insertReview(@RequestBody ReviewDTO reviewDTO) {
		
		try {
			rService.updateReview(reviewDTO);
			
			String redirectUrl = "/bookList/bookDetail?bookNo=" + reviewDTO.getBookNo();
			
			return ResponseEntity.ok(redirectUrl);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("수정 실패");
		}
	}
	
	@PostMapping("/deleteReview")
	public ResponseEntity<String> deleteReview(@RequestParam("reviewNo") int reviewNo, @RequestParam("bookNo") int bookNo) {
		
		try {
	        rService.deleteReview(reviewNo);
	        
	        String redirectUrl = "/bookList/bookDetail?bookNo=" + bookNo;
	        
	        return ResponseEntity.ok(redirectUrl);
	    } catch (Exception e) {
	        // 오류 처리
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("리뷰 삭제 중 오류가 발생했습니다.");
	    }
	}
} 
