package com.tn.cart.dao;

import java.util.List;

import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.CartVO;

public interface CartDAO {

	int insertCart(CartDTO cDto) throws Exception;

	List<CartVO> selectCartList(String user) throws Exception;

}
