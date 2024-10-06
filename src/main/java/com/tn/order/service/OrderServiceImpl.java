package com.tn.order.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import com.tn.order.dao.OrderDAO;
import com.tn.order.model.vo.AddressVO;
import com.tn.order.model.vo.OrderInfo;
import com.tn.util.PropertiesTask;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO oDao;

	@Override
	public OrderInfo otherOrderInfo(String userId, OrderInfo orderInfo) throws Exception {
		
		List<AddressVO> addressList = oDao.selectAddress(userId);
		int orderCount = orderInfo.getTitle().size();
		String titleName = orderInfo.getTitle().get(0);
		String orderName = titleName +" 외 " + (orderCount - 1) + "건";
		String paymentId = UUID.randomUUID().toString();
		
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
	    orderInfo.setStoreId(PropertiesTask.getPropertiesValue("storeId"));
	    orderInfo.setChannelKey(PropertiesTask.getPropertiesValue("channelKey"));
	    orderInfo.setOrderName(orderName);
	    orderInfo.setPaymentId(paymentId);
	    

		
		
		
		return orderInfo;
	}
	


}
