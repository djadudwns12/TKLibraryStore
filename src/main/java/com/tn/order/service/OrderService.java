package com.tn.order.service;



import com.tn.order.model.dto.OrderDTO;
import com.tn.order.model.vo.OrderInfo;

public interface OrderService {

	OrderInfo otherOrderInfo (String userId, OrderInfo orderInfo) throws Exception;



}
