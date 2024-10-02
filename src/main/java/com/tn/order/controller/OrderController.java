package com.tn.order.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tn.cart.model.dto.OrderInfoDTO;

@Controller
@RequestMapping("/order")
public class OrderController {
	

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	

// -----------------------------------------박근영-------------------------------------------------
	@RequestMapping(value = "/payment")
	public String registerMember() {

		return "/order/payment";
	}

	
	
// -----------------------------------------박근영-------------------------------------------------
	
}
