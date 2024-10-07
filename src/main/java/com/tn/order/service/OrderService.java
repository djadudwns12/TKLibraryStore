package com.tn.order.service;



import com.tn.order.model.dto.OrderDTO;
import com.tn.order.model.dto.PaymentInfoDTO;
import com.tn.order.model.vo.OrderInfo;

public interface OrderService {
	
// -----------------------------------------박근영-------------------------------------------------
	// 결제에 필요한 정보 담기
	OrderInfo otherOrderInfo (String userId, OrderInfo orderInfo) throws Exception;
	// 결제 완료 후 적용할 정보의 묶음
	boolean paymentInfoApply(PaymentInfoDTO paymentInfoDTO, String userId);
// -----------------------------------------박근영-------------------------------------------------



}
