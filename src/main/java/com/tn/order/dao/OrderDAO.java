package com.tn.order.dao;

import java.util.List;

import com.tn.order.model.vo.AddressVO;
import com.tn.order.model.vo.OrderBookListVO;

public interface OrderDAO {
	
	// 유저의 주소 SELECT
	List<AddressVO> selectAddress(String userId);
	// 유저의 포인트 SELECT
	int selectPoint(String userId);
	// 주문한 책리스트 SELECT
	List<OrderBookListVO> selectBookList(List<String> bookNos);
	
	

}
