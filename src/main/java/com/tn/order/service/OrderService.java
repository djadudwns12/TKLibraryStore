package com.tn.order.service;



import com.tn.order.model.dto.OrderDTO;
import com.tn.order.model.vo.OrderInfo;

public interface OrderService {

	OrderInfo orderInfo (String userId, OrderDTO orderDTO) throws Exception;

}
