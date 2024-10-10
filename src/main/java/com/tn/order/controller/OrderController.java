package com.tn.order.controller;


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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.tn.cart.model.dto.CartDTO;
import com.tn.member.model.vo.MemberVO;
import com.tn.order.model.dto.OrderDTO;
import com.tn.order.model.dto.PaymentInfoDTO;
import com.tn.order.model.vo.AddressVO;
import com.tn.order.model.vo.OrderInfo;
import com.tn.order.model.vo.OrderVO;
import com.tn.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);


	@Autowired
	private OrderService oService;
	

// -----------------------------------------박근영-------------------------------------------------
	//박근영
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public ResponseEntity<Void> payment(@ModelAttribute OrderInfo orderInfo, HttpSession session)  {
		System.out.println(orderInfo.toString());
		
		String userId = ((MemberVO)session.getAttribute("loginMember")).getUserId();
		try {
			orderInfo = oService.otherOrderInfo(userId, orderInfo);
		} catch (Exception e) {
			
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NOT_ACCEPTABLE);
		}
		System.out.println(orderInfo);
		session.setAttribute("orderInfo", orderInfo);

		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	//박근영
    @GetMapping("/payment")
    public String showPaymentPage(HttpSession session, Model model) {
        // 세션에서 데이터 가져오기
        OrderInfo orderInfo = (OrderInfo) session.getAttribute("orderInfo");
        System.out.println(orderInfo);
        if (orderInfo == null) {
            return "redirect:/cart/cartPage";
        }
        model.addAttribute("orderInfo", orderInfo);
        return "/order/payment"; 
    }
    //박근영
    @PostMapping("paymentInfo")
    public ResponseEntity<String> PaymentInfo(@RequestBody PaymentInfoDTO paymentInfoDTO, HttpSession session) {
    	String userId = ((MemberVO)session.getAttribute("loginMember")).getUserId();
    	System.out.println("paymentInfo 인서트 전 확인" + paymentInfoDTO.toString());
    	//카트테이블에서 삭제, 멤머 포인트 차감한값으로 update, 포인트 로그에 사용으로 기록 남기기, order 에 insert
    	// 멤버 테이블에 구매 금액 업데이트
    	paymentInfoDTO.setUserId(userId);
    	boolean result = oService.paymentInfoApply(paymentInfoDTO);
    	
		return new ResponseEntity<String>("/cart/cartPage", HttpStatus.OK);
    }
	
	
// -----------------------------------------박근영-------------------------------------------------
    
// -----------------------------------------최미설-------------------------------------------------
    // Member테이블에 userPoint 업데이트 <= Order.plannedPoint
    // updatePoint(paymentInfoDTO, session);
    @RequestMapping("/pointTest")
    public void pointTest(HttpSession session) {
    	String userId = ((MemberVO)session.getAttribute("loginMember")).getUserId();
    	// 주문내역에서 "배송완료"인 주문건 가져오기
    	// if(스케줄러>=3일){}
    	OrderVO sinOrder;
		try {
			sinOrder = oService.getSinOrder(userId);
			updateUserPoint(sinOrder, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	System.out.println("포인트테스트 진행.......");
    }
    // 스케줄러로 3일 이후 배송상태가 배송완료로 변경될 때 실행할 메서드
    private void updateUserPoint (OrderVO sinOrder, String userId) {
    	
    	// int pPoint = paymentInfoDTO.getFinalInputPoint();
    	boolean udPoint = false;
		try {
			// 1. 멤버테이블에 포인트 누적
			if(oService.updatePoint(userId, sinOrder)) {
				// 2. 포인트로그에 기록
				oService.recordPointLog(userId, sinOrder);
				System.out.println(userId + "유저의 포인트 업데이트!" );
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	
    	
    	
    }
 // -----------------------------------------최미설-------------------------------------------------
}