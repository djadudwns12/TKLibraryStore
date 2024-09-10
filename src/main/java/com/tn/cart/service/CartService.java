package com.tn.cart.service;

import java.util.List;

import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.CartVO;

public interface CartService {

	boolean putCart(CartDTO cDto) throws Exception;

	List<CartDTO> getCartList(String userId) throws Exception;


}
