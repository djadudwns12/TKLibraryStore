package com.tn.order.service;

import com.tn.order.model.dto.OrderDTO;
import com.tn.order.model.dto.PaymentInfoDTO;
import com.tn.order.model.vo.OrderInfo;

import java.util.List;

import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;
import com.tn.order.model.vo.OrderVO;

public interface OrderService {
	
// -----------------------------------------박근영-------------------------------------------------
	// 결제에 필요한 정보 담기
	OrderInfo otherOrderInfo (String userId, OrderInfo orderInfo) throws Exception;
	// 결제 완료 후 적용할 정보의 묶음
	void paymentInfoApply(PaymentInfoDTO paymentInfoDTO) throws Exception;
	// 하루가 지난 주문 '배송중' 변경
	void orderStatusToShipping() throws Exception;
	// 3일이 지난 주문 '배송완료' 변경
	void orderStatusToDelivered() throws Exception;
// -----------------------------------------박근영-------------------------------------------------

// -----------------------------------------엄영준-------------------------------------------------
/**
	 * @작성자 : 엄영준 
	 * @작성일 : 2024. 10. 4. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : getOrderList
	 * @param
	 * @param
	 * @return : List<OrderVO>
	 * @throws 
	 * @description : 회원이 주문한 목록을 불러오는 메서드
	 *
	 */
	List<BooklistVO> getOrderList(MemberDTO loginMember) throws Exception;
// -----------------------------------------엄영준-------------------------------------------------




}
