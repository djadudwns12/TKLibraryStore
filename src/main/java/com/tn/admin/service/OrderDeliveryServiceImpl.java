package com.tn.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tn.admin.dao.OrderDeliveryDAO;
import com.tn.admin.model.vo.CancelOrderVODTO;
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
	
	@Override
	public void cancelOrder(List<String> orderNos) {
		// 주문번호로 사용한 포인트 및 pk , userId 가져오기, member에서 총 구입액, 사용자 포인트가져오기, 사용한포인트와 사용자포인트 합쳐서 insert,
		// pk를 가지고 포인트 로그의 why와 매칭하여 삭제
		List<CancelOrderVODTO> orderInfo= obDao.selectOrderInfo(orderNos);
		orderInfo.addAll(obDao.selectMemberInfo(orderInfo));
		System.out.println(orderInfo);
	}
//-----------------------------------------박근영-------------------------------------------------



}
