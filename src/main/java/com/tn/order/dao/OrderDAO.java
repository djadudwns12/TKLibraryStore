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
	List<AddressVO> selectAddress(String userId);
	// 유저의 포인트 SELECT
	int selectPoint(String userId);
	
	// 결제 정보를 INSERT
	int insertPaymentInfo(PaymentInfoDTO paymentInfoDTO);
	// BookNo SELECT
	List<PaymentInfoVO> selectBookNo(PaymentInfoDTO paymentInfoDTO);
	
	// 주문한 책리스트 SELECT
//	List<OrderBookListVO> selectBookList(List<String> bookNos);

// -----------------------------------------박근영-------------------------------------------------	

// -----------------------------------------엄영준-------------------------------------------------	
  List<BooklistVO> selectOrderList(MemberDTO loginMember)throws Exception;
// -----------------------------------------엄영준-------------------------------------------------	
  
//-----------------------------------------최미설-------------------------------------------------
  // 배송완료 주문건 가져오기
  OrderVO getSinOrder(String userId);
  
  // 포인트 업데이트
  int updatePoint(String userId, OrderVO sinOrder) throws Exception;
  
  // 포인트로그 추가
  int recordPointLog(String userId, OrderVO sinOrder) throws Exception;
  
  // 탈퇴회원 주문건 업데이트
  int updateUnregisterInfo(String deletedMember) throws Exception;
  
  // 탈퇴요청 회원의 주문건을 확인해서 주문이 없거나 배송완료되었을 때만 탈퇴가 진행되도록 한다.
  List<OrderVO> checkRemainOrder(String deletedMember) throws Exception;
  
//-----------------------------------------최미설-------------------------------------------------



}
