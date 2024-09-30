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
		
		System.out.println("CartDAOImpl / " + cartId + "���� ��������~~~");
		
		return ses.delete(NS + ".deleteCartWithId", cartId);
	}

	@Override
	public int updateQty(int cartId, int qty) throws Exception {
		
		System.out.println("CartDAOImpl / " + cartId + "���� ������ " + qty + "���� ��������~~~~~~~");
		
		// �Ķ���͸� Map�� ����
	    Map<String, Object> params = new HashMap<>();
	    params.put("cartId", cartId);
	    params.put("qty", qty);

	    // Mapper�� Map�� ����
	    return ses.update(NS + ".updateQty", params);
	}

	@Override
	public int deleteCartsByIds(List<Integer> cartIds) throws Exception {
		
		System.out.println("CartDAOImpl : 삭제할 cartId - " + cartIds);
		
		return ses.delete(NS + ".deleteSelectedItems", cartIds);
	}
}
