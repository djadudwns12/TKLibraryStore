package com.tn.cart.service;

import java.util.List;
import java.util.Map;

import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.CartVO;

public interface CartService {

	List<CartDTO> getCartList(String userId) throws Exception;

	boolean deleteCartById(String cartId) throws Exception;

	boolean updateQuantity(int cartId, int qty) throws Exception;

	boolean deleteCartsByIds(List<Integer> cartIds) throws Exception;

	float getPointRate(String userId) throws Exception;

	int getCartCnt(String userId) throws Exception;

	// ============================== (이아림 start) =====================================
	// 상세페이지에서 장바구니에 담으려는 상품이 장바구니에 이미 존재하는지 확인 
	String findBookByBookNo(int bookNo, String userId, int qty) throws Exception;

	
	// ================================ (이아림 end) ======================================


}
