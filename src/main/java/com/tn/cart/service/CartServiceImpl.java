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
		System.out.println("CartServiceImpl : " + cartId + "���� ��������~~~~~~~");
		
		boolean result = false;
		
		if(cDao.deleteOneCart(cartId) == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean updateQuantity(int cartId, int qty) throws Exception {
		System.out.println("CartServiceImpl : " + cartId + "���� ������ " + qty + "�� ��������~~~~~");
		
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
//		// 1. ����� ��ٱ��� ����� ������
//		List<CartDTO> cartList = cDao.selectCartList(cDto.getUserId());
//
//		// 2. ������ title�� �ִ��� Ȯ��
//		for (CartDTO cartItem : cartList) {
//			if (cartItem.getTitle().equals(cDto.getTitle())) {
//				// 3. ������ �ջ�
//				int newQty = cartItem.getQty() + cDto.getQty();
//
//				// 4. DB�� ���� ������Ʈ
//				cDao.updateQty(cartItem.getCartId(), newQty);
//
//				// 5. ���� �׸��� ������ ������Ʈ�����Ƿ� true�� ����
//				result = true;
//
//				return result; // �ߺ� �׸��� ó�������Ƿ� �޼��带 ����
//			}
//		}
//
//		// 6. ������ title�� ������ ���ο� �׸��� ��ٱ��Ͽ� �߰�
//		if (cDao.insertCart(cDto) == 1) {
//			result = true;
//		}
//
//		return result;
//	}

}
