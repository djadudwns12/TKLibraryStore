package com.tn.booklist.controller;

import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tn.booklist.model.dto.PagingInfo;
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
//			List<BooklistVO> listAll = bService.getAllBooklist(dto);
			
			model.addAttribute("listAll", list);
			model.addAttribute("pagingInfo", pi);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			model.addAttribute("exception", "error");
		}
		
//		return "/bookList/listAll";
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

	
}

