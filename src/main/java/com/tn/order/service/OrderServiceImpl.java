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
	public OrderInfo otherOrderInfo(String userId, OrderInfo orderInfo) throws Exception {
		
		List<AddressVO> addressList = oDao.selectAddress(userId);
		
		System.out.println("!!!!!!!!!!!!!!!!!" + addressList);
		int userPoint = oDao.selectPoint(userId);
		AddressVO defaultAddress = null;
		for (AddressVO address : addressList) {
			if(address.getIsDefault().equals("Y")) {
				defaultAddress = address;
				break;
			}
		}
		
		orderInfo.setAddress(addressList);
	    orderInfo.setDefaultAddress(defaultAddress);
	    orderInfo.setUserPoint(userPoint);



		
		
		
		return orderInfo;
	}
	


}
