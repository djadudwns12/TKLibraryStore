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
		
		System.out.println("CartDAOImpl / " + userId + " Cart List");
		
		return ses.selectList(NS + ".getCartList", userId);
	}

	@Override
	public int deleteOneCart(String cartId) throws Exception {
		
		System.out.println("CartDAOImpl / " + cartId + "번을 삭제하자~~~");
		
		return ses.delete(NS + ".deleteCartWithId", cartId);
	}

	@Override
	public int updateQty(int cartId, int qty) throws Exception {
		
		System.out.println("CartDAOImpl / " + cartId + "번의 수량을 " + qty + "개로 수정하자~~~~~~~");
		
		// 파라미터를 Map에 저장
	    Map<String, Object> params = new HashMap<>();
	    params.put("cartId", cartId);
	    params.put("qty", qty);

	    // Mapper에 Map을 전달
	    return ses.update(NS + ".updateQty", params);
	}
}
