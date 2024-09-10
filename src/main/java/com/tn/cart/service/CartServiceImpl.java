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
		System.out.println("CartServiceImpl : " + userId + "의 장바구니 리스트를 봐보자~");
		
		List<CartDTO> list = cDao.selectCartList(userId);
		
		return list;
	}

}
