package com.tn.cart.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	
	
	@RequestMapping("/cartPage")
	public String goShoppingList() {
		System.out.println("��ٱ��Ϸ� ����~");
		return "/cart/cartPage";
	}
	
}
