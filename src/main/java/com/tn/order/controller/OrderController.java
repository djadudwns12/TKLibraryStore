package com.tn.order.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tn.cart.model.dto.OrderInfoDTO;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@PostMapping(value = "/payment", produces = "application/json; charset=utf-8")
	public ResponseEntity<Map<String, Boolean>> processPayment(@RequestBody OrderInfoDTO orderInfoDTO) {
	    System.out.println("payment 진입확인");
	    System.out.println(orderInfoDTO.toString());
	    return ResponseEntity.ok().body(Map.of("success", true));
	}
	
}
