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
	public float getPointRate(String userId) throws Exception {
		System.out.println("CartServiceImpl : " + userId + "의 적립률을 가져오자.");
		
		float pointRate = cDao.getPointRate(userId);
		
		return pointRate;
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

	@Override
	public boolean deleteCartsByIds(List<Integer> cartIds) throws Exception {
	    System.out.println("CartServiceImpl : 삭제할 cartId - " + cartIds);
	    
	    boolean result = false;
	    
	    // cartIds의 크기(삭제할 수) 체크
	    if (cartIds != null && !cartIds.isEmpty()) {
	        // DAO에서 삭제 작업 수행하고, 삭제된 수를 받음
	        int deletedCount = cDao.deleteCartsByIds(cartIds);
	        
	        // 삭제된 수가 0보다 크면 성공으로 간주
	        if (deletedCount > 0) {
	            result = true;
	        }
	    }
	    
	    return result;
	}

	

}
