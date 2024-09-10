package com.tn.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.CartVO;
import com.tn.cart.model.vo.MyResponseWithData;
import com.tn.cart.service.CartService;

import lombok.RequiredArgsConstructor;


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
	
	@RequestMapping(value="/cartPage", method = RequestMethod.POST, produces = "application/json; charset=UTF-8;")
	public String showCartList(@RequestParam("userId") String userId, Model model, HttpServletRequest request) {
		
		userId = "gayoon";
		
		List<CartDTO> userCartList = null;
		
		try {
			userCartList = (List<CartDTO>)cService.getCartList(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("userCartList", userCartList);
		System.out.println(userCartList);
		return "cart/cartPage";
	}
	

	

}