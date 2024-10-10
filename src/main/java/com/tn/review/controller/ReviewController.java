package com.tn.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tn.review.model.DTO.ReviewDTO;
import com.tn.review.service.ReviewService;

@Controller
@RequestMapping("/bookList")
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	@RequestMapping(value="/bookDetail", method = RequestMethod.POST)
	private String saveNewReview(ReviewDTO reviewDTO, RedirectAttributes redirectAttributes) throws Exception {
		
		System.out.println("This is review!!!! " + reviewDTO.toString());

		String returnPage = "redirect: /bookList/bookDetail";
		try {
			if (rService.saveBoard(reviewDTO)) { // 리뷰 글 저장에 성공했다면
				redirectAttributes.addAttribute("status", "success");

			}
		} catch (Exception e) { // 리뷰 글 저장에 실패했다면..
			e.printStackTrace();

			redirectAttributes.addAttribute("status", "fail");
		}

		return returnPage; 
	}

} 
