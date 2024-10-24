package com.tn.cart.dao;

import org.springframework.stereotype.Repository;

import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.CartVO;

import lombok.RequiredArgsConstructor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

@Repository
@RequiredArgsConstructor
public class CartDAOImpl implements CartDAO {

	private final SqlSession ses;
	private static final String NS = "com.tn.mapper.cartMapper";
	

	@Override
	public List<CartDTO> selectCartList(String userId) throws Exception {
		
		return ses.selectList(NS + ".getCartList", userId);
	}
	
	@Override
	public float getPointRate(String userId) throws Exception {
		
		return ses.selectOne(NS + ".getPoingRate", userId);
	}

	@Override
	public int deleteOneCart(String cartId) throws Exception {
		
		return ses.delete(NS + ".deleteCartWithId", cartId);
	}

	@Override
	public int updateQty(int cartId, int qty) throws Exception {
		
		// �Ķ���͸� Map�� ����
	    Map<String, Object> params = new HashMap<>();
	    params.put("cartId", cartId);
	    params.put("qty", qty);

	    // Mapper�� Map�� ����
	    return ses.update(NS + ".updateQty", params);
	}

	@Override
	public int deleteCartsByIds(List<Integer> cartIds) throws Exception {
		
		return ses.delete(NS + ".deleteSelectedItems", cartIds);
	}

	@Override
	public int getCartCnt(String userId) throws Exception {
		
		return ses.selectOne(NS + ".countCartList", userId);
	}

	// ============================== (이아림 start) =====================================
	

	@Override
	public int isExistInCart(int bookNo, String userId) throws Exception {
		Map<String, Object> params = new HashMap<>();
	    params.put("userId", userId);
	    params.put("bookNo", bookNo);
		return ses.selectOne(NS + ".isExistInCart", params);
	}

	@Override
	public int updateCart(String userId, int bookNo, int qty) {
		Map<String, Object> params = new HashMap<>();
	    params.put("userId", userId);
	    params.put("bookNo", bookNo);
	    params.put("qty", qty);
		return ses.update(NS + ".updateCart", params);
	}

	@Override
	public int insertCart(String userId, int bookNo, int qty) throws Exception {
		Map<String, Object> params = new HashMap<>();
	    params.put("userId", userId);
	    params.put("bookNo", bookNo);
	    params.put("qty", qty);
		return ses.insert(NS + ".insertCart", params);
	}
	
	
	// ================================ (이아림 end) ======================================

}
