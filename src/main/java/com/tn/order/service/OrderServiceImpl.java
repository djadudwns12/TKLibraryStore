package com.tn.order.service;



import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;

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
import org.springframework.transaction.annotation.Transactional;

import com.tn.order.dao.OrderDAO;
import com.tn.order.model.dto.PaymentInfoDTO;
import com.tn.order.model.vo.AddressVO;
import com.tn.order.model.vo.OrderInfo;
import com.tn.order.model.vo.PaymentInfoVO;
import com.tn.util.PropertiesTask;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO oDao;

	
	
	
	
// -----------------------------------------박근영-------------------------------------------------
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

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void paymentInfoApply(PaymentInfoDTO paymentInfoDTO) throws Exception {
		//카트테이블에서 삭제, 멤머 포인트 차감한값으로 update, 포인트 로그에 사용으로 기록 남기기, order 에 insert
    	// 멤버 테이블에 구매 금액 업데이트
		
		System.out.println(paymentInfoDTO.getCartId().get(0));
		
			oDao.insertPaymentInfo(paymentInfoDTO);
			List<PaymentInfoVO> bookNo = oDao.selectBookNo(paymentInfoDTO);
			
			for(int i = 0; i < bookNo.size() ; i ++) {
				bookNo.get(i).setOrderNo(paymentInfoDTO.getPaymentId());
				bookNo.get(i).setQty(paymentInfoDTO.getBookQty().get(i));
			}
			oDao.insertBooks(bookNo);
			oDao.updatePoint(paymentInfoDTO);
			System.out.println("포인트 로그 인서트 전 확인을 위한 시스:"+paymentInfoDTO.getOrderPK());
			if (paymentInfoDTO.getFinalInputPoint() != null && Integer.parseInt(paymentInfoDTO.getFinalInputPoint()) > 0) {
				oDao.insertUsePoint(paymentInfoDTO);
			}
			oDao.deleteCart(paymentInfoDTO);
			
			PaymentInfoVO totalPay = oDao.selectTotalPay(paymentInfoDTO);
			System.out.println(totalPay.getUserTotalPay());
			
			int userTotalPay = totalPay.getUserTotalPay() + Integer.parseInt(paymentInfoDTO.getTotalAmount());
			paymentInfoDTO.setUserTotalPay(userTotalPay);
			oDao.updateTotalPay(paymentInfoDTO);
			
	}
	
	@Override
	public void orderStatusToShipping() throws Exception {
		oDao.updateOrdersToShipping();
		
	}
	
	@Override
	public void orderStatusToDelivered() throws Exception {
		oDao.updateOrdersToDelivered();
		
	}
	
	
// -----------------------------------------박근영-------------------------------------------------

// -----------------------------------------엄영준-------------------------------------------------
  @Override
	public List<BooklistVO> getOrderList(MemberDTO loginMember)throws Exception {
		
		return oDao.selectOrderList(loginMember);
	}
// -----------------------------------------엄영준-------------------------------------------------






}
