package com.tn.cart.dao;

import org.springframework.stereotype.Repository;

import com.tn.cart.model.dto.CartDTO;
import com.tn.cart.model.vo.CartVO;

import lombok.RequiredArgsConstructor;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

@Repository
@RequiredArgsConstructor
public class CartDAOImpl implements CartDAO {

	private final SqlSession ses;
	private static final String NS = "com.tn.mapper.cartMapper";
	
	@Override
	public int insertCart(CartDTO cDto) throws Exception {
		
		return ses.insert(NS + ".putCart", cDto);
	}

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
}