package com.tn.cart.dao;

import java.util.List;

import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.CartVO;

public interface CartDAO {

	List<CartDTO> selectCartList(String userId) throws Exception;

	int deleteOneCart(String cartId) throws Exception;

	int updateQty(int cartId, int qty) throws Exception;

	int deleteCartsByIds(List<Integer> cartIds) throws Exception;

	float getPointRate(String userId) throws Exception;

}
