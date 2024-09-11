package com.tn.cart.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.MyResponseWithData;
import com.tn.cart.service.CartService;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	// Log를 남길 수 있도록 하는 객체
	private static Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cService;
	
	@RequestMapping("/cartPage")
	public String goCart(@RequestParam("userId") String userId) {
		return userId;
	}
	
	@GetMapping("/cartPage/{userId}")
	public ResponseEntity showCartList(@PathVariable("userId") String userId, HttpSession ses) {
		
		System.out.println("CartController / " + userId + " Cart List");
		
		ResponseEntity result = null;
		
		try {
			List<CartDTO> list = cService.getCartList(userId);
			
			result = new ResponseEntity(MyResponseWithData.success(list), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			result = new ResponseEntity(MyResponseWithData.fail(), HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
	

	

}