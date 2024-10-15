package com.tn.admin.service;

import java.util.List;

import com.tn.admin.model.vo.OrderDeliveryVO;

public interface OrderDeliveryService {
//-----------------------------------------박근영-------------------------------------------------
	// 주문정보 불러오기
	List<OrderDeliveryVO> orderDeliveryInfo();
	// 주문취소하기
	void cancelOrder(List<String> orderNos);
//-----------------------------------------박근영-------------------------------------------------
	

}
