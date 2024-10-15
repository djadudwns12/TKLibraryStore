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
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tn.order.dao.OrderDAO;
import com.tn.order.model.dto.PaymentInfoDTO;
import com.tn.order.model.vo.AddressVO;
import com.tn.order.model.vo.OrderDetailVO;
import com.tn.order.model.vo.OrderInfo;
import com.tn.order.model.vo.OrderVO;
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
	public boolean paymentInfoApply(PaymentInfoDTO paymentInfoDTO) {
		//카트테이블에서 삭제, 멤머 포인트 차감한값으로 update, 포인트 로그에 사용으로 기록 남기기, order 에 insert
    	// 멤버 테이블에 구매 금액 업데이트
		System.out.println(paymentInfoDTO.getCartId().get(0));
		
		oDao.insertPaymentInfo(paymentInfoDTO);
		
		List<PaymentInfoVO> bookNo = oDao.selectBookNo(paymentInfoDTO);
		
		
		System.out.println("북엔오 확인"+ bookNo.toString());
		//oDao.insertPaymentInfo(paymentInfoDTO);
		
		
		return false;
	}
// -----------------------------------------박근영-------------------------------------------------

// -----------------------------------------엄영준-------------------------------------------------
  @Override
	public List<BooklistVO> getRecentOrderList(MemberDTO loginMember)throws Exception {
		
		return oDao.selectRecentOrderList(loginMember);
	}

	@Override
	@Transactional(readOnly = true)
	public List<OrderVO> getOrderList(MemberDTO loginMember) throws Exception {
		// TODO Auto-generated method stub
		return oDao.selectMyPageOrderList(loginMember);
	}

	@Override
	public List<OrderDetailVO> getDetailOrder(String orderNo) throws Exception {
		// TODO Auto-generated method stub
		return oDao.selectDetailOrder(orderNo);
	}

	@Override
	@Transactional(	propagation = Propagation.REQUIRED, // 전파 속성 : 메서드실행시 각각 OPEN / CLOSE 시키는 것이 아닌 한번만 OPEN/CLOSE 실행 REQUIRED(디폴트 값)- 가장 많이 사용
					rollbackFor = Exception.class, // 예외가 발생하면 rollback 시키겠다.
					isolation = Isolation.DEFAULT) // 작업중일때 한번에 한작업만 실행 (커밋을 하기 전에는 다른 작업 X) DEFAULT: 주로  사용
	public boolean orderCancel(List<String> ckArr)  throws Exception {
		
		boolean result = false;
		// 주문취소 처리
		int delYN = oDao.updateOrderCancel(ckArr);
		// 체크 한만큼 수정되었을경우 
		if(delYN == ckArr.size()) {
			System.out.println(delYN);
			result = true;
		}
		
		
		
		
		return result;
	}
	
	
	
  
  
// -----------------------------------------엄영준-------------------------------------------------
}
