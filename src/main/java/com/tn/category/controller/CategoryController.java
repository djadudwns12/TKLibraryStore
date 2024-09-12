package com.tn.category.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.tn.category.model.vo.CategoryVO;
import com.tn.category.service.CategoryService;

/**
 * Handles requests for the application home page.
 */
@RestController
public class CategoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	CategoryService cService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/category/{category}", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity home(@PathVariable("category") String category) {
		System.out.println(category+" 카테고리 ");
		
		// db에서 카테고리 불러오기 
		List<CategoryVO> list = null;
		ResponseEntity result = null;
		try {
			list = cService.getCategoryList(category);
			result = new ResponseEntity(list, HttpStatus.OK);
			//System.err.println(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = new ResponseEntity(HttpStatus.BAD_REQUEST);
		}
		
		
		return result;
	}
	
}
