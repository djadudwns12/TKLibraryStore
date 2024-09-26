package com.tn.cart.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tn.cart.dao.CartDAO;
import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.CartVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

	private final CartDAO cDao;
	
	@Override
	public boolean putCart(CartDTO cDto) throws Exception {

		boolean result = false;
		
		if(cDao.insertCart(cDto) == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public List<CartDTO> getCartList(String userId) throws Exception {
		System.out.println("CartServiceImpl : " + userId + " Cart List");
		
		List<CartDTO> list = cDao.selectCartList(userId);
		
		return list;
	}

	@Override
	public boolean deleteCartById(String cartId) throws Exception {
		System.out.println("CartServiceImpl : " + cartId + "번을 삭제하자~~~~~~~");
		
		boolean result = false;
		
		if(cDao.deleteOneCart(cartId) == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean updateQuantity(int cartId, int qty) throws Exception {
		System.out.println("CartServiceImpl : " + cartId + "번의 수량을 " + qty + "로 수정하자~~~~~");
		
		boolean result = false;
		
		if(cDao.updateQty(cartId, qty) == 1) {
			result = true;
		}
		
		return result;
	}

}
