package com.tn.cart.controller;

import java.util.List;

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
	
	// Log�� ���� �� �ֵ��� �ϴ� ��ü
	private static Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cService;
	
	@RequestMapping("/cartPage")
	public void goCart() {
		
	}
	

	

}