package com.tn.order.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import com.tn.order.dao.OrderDAO;
import com.tn.order.model.vo.AddressVO;
import com.tn.order.model.vo.OrderInfo;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO oDao;

	@Override
	public OrderInfo otherOrderInfo(String userId, OrderInfo orderInfo) throws Exception {
		
		List<AddressVO> addressList = oDao.selectAddress(userId);
		
		int userPoint = oDao.selectPoint(userId);
		AddressVO defaultAddress = null;
		LocalDate arrivalDate = LocalDate.now().plusDays(1); //현재 날짜에 1 더하기
		String formattedDate = arrivalDate.format(DateTimeFormatter.ofPattern("yyyy년 M월 d일 E요일", Locale.KOREAN));
		
		for (AddressVO address : addressList) {
			if(address.getIsDefault().equals("Y")) {
				defaultAddress = address;
				break;
			}
		}
		
		orderInfo.setAddress(addressList);
	    orderInfo.setDefaultAddress(defaultAddress);
	    orderInfo.setUserPoint(userPoint);
	    orderInfo.setArrivalDate(formattedDate);


		
		
		
		return orderInfo;
	}
	


}
