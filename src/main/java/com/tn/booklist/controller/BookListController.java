package com.tn.booklist.controller;

import java.lang.invoke.StringConcatFactory;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tn.booklist.model.dto.PagingInfo;
import com.tn.booklist.model.dto.PagingInfoDTO;
import com.tn.booklist.model.vo.BookDetailInfo;
import com.tn.booklist.model.vo.BooklistVO;
import com.tn.booklist.service.BooklistService;
import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.CartVO;
import com.tn.cart.service.CartService;
import com.tn.member.model.vo.MemberVO;
import com.tn.util.GetClientIPAddr;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/bookList")
public class BookListController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookListController.class);
	
	@Autowired
	private BooklistService bService;
	@Autowired		
	private CartService cService;

	private CartDTO cdto;
	

	
	// 책 전체 리스트를 불러오는 메서드 
	@RequestMapping("/listAll")
	public void getAllList(Model model, @RequestParam(value="pageNo", defaultValue = "1") int pageNo, @RequestParam(value="pagingSize", defaultValue = "10")int pagingSize) {
		
		PagingInfoDTO dto = PagingInfoDTO.builder()
				.pageNo(pageNo)
				.PagingSize(pagingSize)
				.build();
		
		List<BooklistVO> list = null;
		Map<String, Object> result = null;
		 
		try {
			result = bService.getAllBooklist(dto);
			PagingInfo pi = (PagingInfo) result.get("pagingInfo");
			
			list = (List<BooklistVO>) result.get("listAll");
			
			model.addAttribute("listAll", list);
			model.addAttribute("pagingInfo", pi);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			model.addAttribute("exception", "error");

		}
		
	}
//	====================================================================엄영준(start)===========================================================================
	@RequestMapping("/category/{categoryNo}")
	public ResponseEntity<Map<String, Object>> bookCategory(@PathVariable("categoryNo") String category
															,@RequestParam(value ="pageNo",defaultValue = "1") int pageNo 
															, @RequestParam(value = "pageSize",defaultValue = "10") int pagingSize) {
		ResponseEntity<Map<String, Object>> result = null;
		
		PagingInfoDTO dto = PagingInfoDTO.builder()
				.pageNo(pageNo)
				.PagingSize(pagingSize)
				.build();
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		try {
			resultMap = bService.getCategoryBooklist(dto,category);
			
			result = new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
	
	
	
//	====================================================================엄영준(end)=============================================================================
	
	// 책 상세페이지를 불러오는 메서드 
	@RequestMapping("/bookDetail")
	public String bookDetail(@RequestParam("bookNo") int bookNo, Model model, HttpServletRequest request) {
		
		String returnBDetail = "";
		List<BookDetailInfo> bookDetailInfo = null;

	         String ipAddr = GetClientIPAddr.getClientIP(request);
//	         System.out.println(ipAddr + "가 " + bookNo + "번 책 정보를 검색한다!!");
	         
	         if (request.getRequestURI().contains("/bookDetail")) {
	        	 	
//	        	 	System.out.println("상세페이지 호출..................");
	        	 	
	        	 	try {   
	        	  	
			        returnBDetail = "/bookList/bookDetail";
			        bookDetailInfo = bService.read(bookNo, ipAddr);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
	         }

	      model.addAttribute("bookDetailInfo", bookDetailInfo);

		
		return returnBDetail;
		
	}
	

	// 수량 선택해 장바구니 버튼을 누르면 카트에 상품이 담기는 메서드
	@PostMapping("/insertCart")
	@ResponseBody
	public String addToCart(@RequestParam("qty") int qty, @RequestParam("bookNo") int bookNo, HttpSession ses) {
		
		
	String result = null;
		
		MemberVO loginMember = (MemberVO) ses.getAttribute("loginMember");
		String userId = loginMember.getUserId();
//		
		System.out.println(qty +"bookNo"+ bookNo + userId);
		try {
			result = cService.findBookByBookNo(bookNo, userId, qty);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return result;
			
	}

}

