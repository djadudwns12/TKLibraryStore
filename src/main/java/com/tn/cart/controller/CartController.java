package com.tn.cart.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	
	
	@RequestMapping("/cartPage")
	public String goShoppingList() {
		System.out.println("장바구니로 가자~");
		return "/cart/cartPage";
	}
	
}
