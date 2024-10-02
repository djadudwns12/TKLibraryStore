package com.tn.order.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
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
