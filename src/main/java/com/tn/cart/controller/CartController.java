package com.tn.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.CartVO;
import com.tn.cart.model.vo.MyResponseWithData;
import com.tn.cart.service.CartService;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService cService;
	
	@RequestMapping("/cartPage")
	public void goCart() {
		
	}
	
	@PostMapping("/putCart")
	public ResponseEntity goShoppingList(@RequestBody CartDTO cDto) {
		System.out.println("CartController - " + cDto + " : 얘네를 장바구니에 넣으러 가자~");
		
		ResponseEntity result = null;
		
		try {
			if(cService.putCart(cDto)) {
				result = new ResponseEntity(MyResponseWithData.success(), HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			result = new ResponseEntity(MyResponseWithData.fail(), HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
	
	@GetMapping(value="/cartPage/{userId}")
	public ResponseEntity getCartList(@PathVariable("userId") String userId, HttpSession ses) {
		System.out.println(userId + "의 장바구니 리스트를 봐보자.");
		
		ResponseEntity result = null;
		
		try {
			List<CartVO> list = cService.getCartList(userId);
			
			result = new ResponseEntity(MyResponseWithData.success(), HttpStatus.OK);
		} catch (Exception e) {	
			e.printStackTrace();
			
			result = new ResponseEntity(MyResponseWithData.fail(), HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
}