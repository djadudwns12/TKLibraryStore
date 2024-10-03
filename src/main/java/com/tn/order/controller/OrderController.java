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
    @GetMapping("/payment")
    public String showPaymentPage(HttpSession session, Model model) {
        // 세션에서 데이터 가져오기
        OrderInfo orderInfo = (OrderInfo) session.getAttribute("orderInfo");
        if (orderInfo == null) {
            return "redirect:/cart/cartPage";
        }
        model.addAttribute("orderInfo", orderInfo);
        return "/order/payment"; 
    }
	
	
// -----------------------------------------박근영-------------------------------------------------
}