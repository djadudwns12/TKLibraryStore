package com.tn.cart.controller;


import java.util.HashMap;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.MyResponseWithData;
import com.tn.cart.service.CartService;
import com.tn.member.model.vo.MemberVO;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	// Log�� ���� �� �ֵ��� �ϴ� ��ü
	private static Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cService;
	
	@RequestMapping("/cartPage")
	public String goCart(Model model,HttpSession sess) {
		
		ResponseEntity result = null;
		
		String userId = ((MemberVO)sess.getAttribute("loginMember")).getUserId();
		System.out.println("현재 페이지에 들어온 유저의 아이디 : " + userId);
		
		try {
			List<CartDTO> list = cService.getCartList(userId);
			float pointRate = cService.getPointRate(userId);
			
			model.addAttribute("cartList", list);
			model.addAttribute("pointRate", pointRate);
		} catch (Exception e) {
			e.printStackTrace();	
		}		
		return "/cart/cartPage";
	}
	
	@PostMapping("/deleteCart")
	@ResponseBody
	public Map<String, Object> deleteCart(@RequestParam("cartId") String cartId,HttpSession session) {
	    System.out.println("���� ��û����: " + cartId); // �α� �߰�
	    Map<String, Object> response = new HashMap<>();
	    
	    try {
	        cService.deleteCartById(cartId);
	        response.put("success", true);
	        int cartCount = cService.getCartCnt(((MemberVO)session.getAttribute("loginMember")).getUserId());
	        response.put("CartCnt", cartCount);

	    } catch (Exception e) {
	        e.printStackTrace(); // ���� �α� �߰�
	        response.put("success", false);
	    }
	    return response;
	}
	
	@PostMapping("/updateQty")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> updateQuantity(@RequestParam int cartId, @RequestParam int qty) {
	    Map<String, Object> response = new HashMap<>();
	    
	    // DB���� cartId�� �ش��ϴ� �׸��� ã�Ƽ� ���� ������Ʈ ������ �����մϴ�.
	    boolean success = false; // �ʱⰪ ����
	    try {
	        success = cService.updateQuantity(cartId, qty); // ���� ȣ��
	    } catch (Exception e) {
	        e.printStackTrace();
	        // ���� �߻� �� success�� false�� ����
	    }

	    // success �� Ȯ��
	    if (success) {
	        response.put("success", true);
	    } else {
	        response.put("success", false);
	    }
	    return ResponseEntity.ok(response);
	}
	
	@PostMapping("/deleteSelected")
	public ResponseEntity<Map<String, Object>> deleteSelected(@RequestBody List<Integer> cartIds,HttpSession session) {
		
		System.out.println("Controller : 체크박스 선택된 " + cartIds + "번 목록들 삭제하기");
	    
		Map<String, Object> response = new HashMap<>();
		try {
	        cService.deleteCartsByIds(cartIds); // 서비스 호출
	        response.put("success", true);
	        int cartCount = cService.getCartCnt(((MemberVO)session.getAttribute("loginMember")).getUserId());
	        response.put("CartCnt", cartCount);

	    } catch (Exception e) {
	        e.printStackTrace(); // 오류 발생 시 로그 출력
	        response.put("success", false);
	    }
	    return ResponseEntity.ok(response);
	}

}