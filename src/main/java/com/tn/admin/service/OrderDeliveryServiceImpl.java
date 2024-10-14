package com.tn.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tn.admin.dao.OrderDeliveryDAO;
import com.tn.admin.model.vo.OrderDeliveryVO;

@Service
public class OrderDeliveryServiceImpl implements OrderDeliveryService {
	
	@Autowired
	private OrderDeliveryDAO obDao;
	
//-----------------------------------------박근영-------------------------------------------------
	@Override
	public List<OrderDeliveryVO> orderDeliveryInfo() {
		return obDao.selectOrderDeliveryInfo();
	}
//-----------------------------------------박근영-------------------------------------------------

}
