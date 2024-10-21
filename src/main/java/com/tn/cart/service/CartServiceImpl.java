package com.tn.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
		
		List<CartDTO> list = cDao.selectCartList(userId);
		
		return list;
	}
	
	@Override
	public float getPointRate(String userId) throws Exception {
		
		float pointRate = cDao.getPointRate(userId);
		
		return pointRate;
	}

	@Override
	public boolean deleteCartById(String cartId) throws Exception {
		
		boolean result = false;
		
		if(cDao.deleteOneCart(cartId) == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean updateQuantity(int cartId, int qty) throws Exception {
		
		boolean result = false;
		
		if(cDao.updateQty(cartId, qty) == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean deleteCartsByIds(List<Integer> cartIds) throws Exception {
	    
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

	@Override
	public int getCartCnt(String userId) throws Exception {
		
		int CartCnt = 0;

		CartCnt = cDao.getCartCnt(userId);
		
		return CartCnt;
	}

	

	// ============================== (이아림 start) =====================================
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public String findBookByBookNo(int bookNo, String userId, int qty) throws Exception {
		
		String result = "";
		
		// 1. 카트에 해당 책이 있는지 
		int count = cDao.isExistInCart(bookNo, userId);
		System.out.println(count + ": 카트에 담은 이 책의 수");
		// 2. 반환되는 값이 0보다 클 때 update
		if(count > 0) {
			if(cDao.updateCart(userId, bookNo, qty) > 0) {
				result = "updateTrue";
			}else {
				result = "false";
			}
		// 3. 반환되는 값 =0 이면 insert
		}else if(count == 0) {
			if(cDao.insertCart(userId, bookNo, qty) > 0) {
				result = "insertTrue";
			}else {
				result = "false";
			}
		}
		return result;
	}

	// ================================ (이아림 end) ======================================

}
