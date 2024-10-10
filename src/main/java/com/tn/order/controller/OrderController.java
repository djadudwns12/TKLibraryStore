package com.tn.order.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tn.cart.model.dto.OrderInfoDTO;
import com.tn.order.model.dto.OrderDTO;
import com.tn.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	OrderService service;

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@RequestMapping("/test")
	public void test() {
		try {
			// updatePoint(적립받을유저, 적립된포인트)
			boolean result = service.updatePoint("miseol", "20240903miseol0001");
			if(result) {
				System.out.println("OrderController : 포인트 업데이트 성공");
			}
		} catch (Exception e) {
			System.out.println("OrderController : 포인트 업데이트 실패");
			e.printStackTrace();
		}
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		OrderDTO dto = OrderDTO.builder()
			.orderPK(3)
			.orderDate(timestamp)
			.orderStatus("배송완료")
			.orderWho("miseol")
			.bookNo(11)
			.qty(2)
			.totalPay(30000)
			.orderNo("20241007miseol0001")
			.build();
		boolean insertResult;
		try {
			insertResult = service.insertPointLog(dto);
			if(insertResult) {
			System.out.println("OrderController : 포인트로그 기록 완료");
			}
		} catch (Exception e) {
			System.out.println("OrderController : 포인트로그 기록 실패");
			e.printStackTrace();
		}
		
		
	}

// -----------------------------------------박근영-------------------------------------------------
	@RequestMapping(value = "/payment")
	public String registerMember() {

		return "/order/payment";
	}

	
	
// -----------------------------------------박근영-------------------------------------------------
	
}
