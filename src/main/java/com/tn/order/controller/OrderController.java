package com.tn.order.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tn.cart.model.dto.CartDTO;
import com.tn.member.model.vo.MemberVO;
import com.tn.order.model.dto.OrderDTO;
import com.tn.order.model.vo.AddressVO;
import com.tn.order.model.vo.OrderInfo;
import com.tn.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private OrderService oService;
	

// -----------------------------------------박근영-------------------------------------------------
	@RequestMapping(value = "/payment")
	public String payment(@ModelAttribute OrderInfo orderInfo) {
		
		System.out.println(orderInfo.toString());
	
		return "/order/payment";
	}
// -----------------------------------------박근영-------------------------------------------------
	
}
