package com.tn.order.dao;


import java.util.List;
import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;
import com.tn.order.model.vo.OrderVO;

import com.tn.order.model.dto.PaymentInfoDTO;
import com.tn.order.model.vo.AddressVO;
import com.tn.order.model.vo.OrderBookListVO;
import com.tn.order.model.vo.PaymentInfoVO;

public interface OrderDAO {

// -----------------------------------------박근영-------------------------------------------------
	// 유저의 주소 SELECT
	List<AddressVO> selectAddress(String userId) throws Exception;
	// 유저의 포인트 SELECT
	int selectPoint(String userId) throws Exception;
	
	// 결제 정보를 INSERT
	void insertPaymentInfo(PaymentInfoDTO paymentInfoDTO) throws Exception;
	// BookNo SELECT
	List<PaymentInfoVO> selectBookNo(PaymentInfoDTO paymentInfoDTO) throws Exception;
	// 결제(주문)완료한 책 INSERT
	void insertBooks(List<PaymentInfoVO> bookNo) throws Exception;
	// 결제에 사용하고 남은 포인트 총액 UPDATE
	void updatePoint(PaymentInfoDTO paymentInfoDTO) throws Exception;
	// 결제에 사용한 포인트 로그 INSERT
	void insertUsePoint(PaymentInfoDTO paymentInfoDTO) throws Exception;
	// 결제 완료 내역 카트에서 DELETE
	void deleteCart(PaymentInfoDTO paymentInfoDTO) throws Exception;
	// 구매자의 총 구매액을 SELECT
	PaymentInfoVO selectTotalPay(PaymentInfoDTO paymentInfoDTO) throws Exception;
	// 유저의 총 구매액을 UPDATE
	void updateTotalPay(PaymentInfoDTO paymentInfoDTO) throws Exception;
	// 결제 완료 > 배송중 UPDATE
	void updateOrdersToShipping();
	// 배송중 > 배송완료 UPDATE
	void updateOrdersToDelivered();
	
	// 주문한 책리스트 SELECT
//	List<OrderBookListVO> selectBookList(List<String> bookNos);

// -----------------------------------------박근영-------------------------------------------------	

// -----------------------------------------엄영준-------------------------------------------------	
  List<BooklistVO> selectOrderList(MemberDTO loginMember)throws Exception;
// -----------------------------------------엄영준-------------------------------------------------	









}
