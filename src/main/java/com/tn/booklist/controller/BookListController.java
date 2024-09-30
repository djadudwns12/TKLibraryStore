package com.tn.booklist.controller;

import java.lang.invoke.StringConcatFactory;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tn.admin.model.vo.MyResponseWithData;
import com.tn.booklist.model.dto.PagingInfoDTO;
import com.tn.booklist.model.vo.BookDetailInfo;
import com.tn.booklist.model.vo.BooklistVO;
import com.tn.booklist.service.BooklistService;
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

	
	// 책 전체 리스트를 불러오는 메서드 
	@RequestMapping("/listAll")
	public String getAllList(Model model, @RequestParam(value="pageNo", defaultValue = "1") int pageNo, @RequestParam(value="pagingSize", defaultValue = "10")int pagingSize) {
		
		PagingInfoDTO dto = PagingInfoDTO.builder()
				.pageNo(pageNo)
				.PagingSize(pagingSize)
				.build();
		
		try {
			List<BooklistVO> listAll = bService.getAllBooklist(dto);
			model.addAttribute("listAll", listAll);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return "/bookList/listAll";
	}
	
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
	
	
//	====================================================================엄영준(start)===========================================================================
	@RequestMapping("/category/{categoryNo}")
	public ResponseEntity<List<BooklistVO>> bookCategory(@PathVariable("categoryNo") String category) {
		ResponseEntity<List<BooklistVO>> result = null;
		
		
		List<BooklistVO> list;
		try {
			list = bService.getCategoryBooklist(category);
			result = new ResponseEntity<List<BooklistVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = new ResponseEntity<List<BooklistVO>>(HttpStatus.BAD_REQUEST);
		}
		
		
		
		
		
		
		
		
		return result;
	}
	
	
	
//	====================================================================엄영준(end)=============================================================================

	
}

