package com.tn.cart.service;

import java.util.List;

import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.CartVO;

public interface CartService {

	List<CartDTO> getCartList(String userId) throws Exception;

	boolean deleteCartById(String cartId) throws Exception;

	boolean updateQuantity(int cartId, int qty) throws Exception;

	boolean deleteCartsByIds(List<Integer> cartIds) throws Exception;

	float getPointRate(String userId) throws Exception;

	int getCartCnt(String userId) throws Exception;


}
