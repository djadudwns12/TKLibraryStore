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
	
//	@Override
//	public boolean putCart(CartDTO cDto) throws Exception {
//		boolean result = false;
//
//		// 1. 사용자 장바구니 목록을 가져옴
//		List<CartDTO> cartList = cDao.selectCartList(cDto.getUserId());
//
//		// 2. 동일한 title이 있는지 확인
//		for (CartDTO cartItem : cartList) {
//			if (cartItem.getTitle().equals(cDto.getTitle())) {
//				// 3. 수량을 합산
//				int newQty = cartItem.getQty() + cDto.getQty();
//
//				// 4. DB에 수량 업데이트
//				cDao.updateQty(cartItem.getCartId(), newQty);
//
//				// 5. 기존 항목의 수량을 업데이트했으므로 true로 설정
//				result = true;
//
//				return result; // 중복 항목을 처리했으므로 메서드를 종료
//			}
//		}
//
//		// 6. 동일한 title이 없으면 새로운 항목을 장바구니에 추가
//		if (cDao.insertCart(cDto) == 1) {
//			result = true;
//		}
//
//		return result;
//	}

}
