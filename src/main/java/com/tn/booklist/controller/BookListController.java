package com.tn.booklist.controller;

import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tn.booklist.model.dto.PagingInfoDTO;
import com.tn.booklist.model.vo.BooklistVO;
import com.tn.booklist.service.BooklistService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/bookList")
public class BooklistController {
	
	private static final Logger logger = LoggerFactory.getLogger(BooklistController.class);
	
	@Autowired
	private BooklistService bService;
	
	
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
	
}

