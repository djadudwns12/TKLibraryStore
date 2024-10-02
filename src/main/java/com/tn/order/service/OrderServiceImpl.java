package com.tn.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tn.order.dao.OrderDAO;
import com.tn.order.model.dto.OrderDTO;
import com.tn.order.model.vo.AddressVO;
import com.tn.order.model.vo.OrderBookListVO;
import com.tn.order.model.vo.OrderInfo;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO oDao;

	@Override
	public OrderInfo orderInfo(String userId, OrderDTO orderDTO) throws Exception {
		
		List<AddressVO> addressList = oDao.selectAddress(userId);
		int userPoint = oDao.selectPoint(userId);
		List<String> bookNos = orderDTO.getCartIds();
		List<OrderBookListVO> bookList = oDao.selectBookList(bookNos);
		
		
		
		return null;
	}
	


}
