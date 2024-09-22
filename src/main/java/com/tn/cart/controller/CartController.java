package com.tn.cart.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.MyResponseWithData;
import com.tn.cart.service.CartService;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	// Log�� ���� �� �ֵ��� �ϴ� ��ü
	private static Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cService;
	
	@RequestMapping("/cartPage")
	public String goCart(@RequestParam("userId") String userId, Model model) {
		
		ResponseEntity result = null;
		
		try {
			List<CartDTO> list = cService.getCartList(userId);
			
			model.addAttribute("cartList", list);
		} catch (Exception e) {
			e.printStackTrace();	
		}		
		return "/cart/cartPage";
	}
	
	@PostMapping("/deleteCart")
	@ResponseBody
	public Map<String, Object> deleteCart(@RequestParam("cartId") String cartId) {
	    System.out.println("���� ��û����: " + cartId); // �α� �߰�
	    Map<String, Object> response = new HashMap<>();
	    
	    try {
	        cService.deleteCartById(cartId);
	        response.put("success", true);
	    } catch (Exception e) {
	        e.printStackTrace(); // ���� �α� �߰�
	        response.put("success", false);
	    }
	    return response;
	}	

}