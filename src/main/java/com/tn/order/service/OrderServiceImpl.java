package com.tn.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tn.member.model.dto.MemberDTO;
import com.tn.order.dao.OrderDAO;
import com.tn.order.model.dto.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO dao;
	
	@Override
	public boolean updatePoint(String userId, String orderNo) throws Exception {
		boolean result = false;
		if(dao.updatePoint(userId, orderNo) == 1) {
			result=true;
		}
		return result;
	}

	@Override
	public boolean insertPointLog(OrderDTO orderDTO) throws Exception {
		boolean result = false;
		if(dao.insertPointLog(orderDTO) == 1) {
			result=true;
		}
		return result;
	}


}
