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
	
	// Log를 남길 수 있도록 하는 객체
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
	    System.out.println("삭제 요청받음: " + cartId); // 로그 추가
	    Map<String, Object> response = new HashMap<>();
	    
	    try {
	        cService.deleteCartById(cartId);
	        response.put("success", true);
	    } catch (Exception e) {
	        e.printStackTrace(); // 에러 로그 추가
	        response.put("success", false);
	    }
	    return response;
	}
	
	@PostMapping("/updateQty")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> updateQuantity(@RequestParam int cartId, @RequestParam int qty) {
	    Map<String, Object> response = new HashMap<>();
	    
	    // DB에서 cartId에 해당하는 항목을 찾아서 수량 업데이트 로직을 구현합니다.
	    boolean success = false; // 초기값 설정
	    try {
	        success = cService.updateQuantity(cartId, qty); // 서비스 호출
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 예외 발생 시 success는 false로 유지
	    }

	    // success 값 확인
	    if (success) {
	        response.put("success", true);
	    } else {
	        response.put("success", false);
	    }
	    return ResponseEntity.ok(response);
	}

}