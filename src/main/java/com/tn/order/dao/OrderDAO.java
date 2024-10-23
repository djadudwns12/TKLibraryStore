package com.tn.order.dao;


import java.sql.Timestamp;
import java.util.List;
import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;
import com.tn.order.model.vo.OrderVO;
import com.tn.order.model.dto.PaymentInfoDTO;
import com.tn.order.model.vo.AddressVO;
import com.tn.order.model.vo.DeliveryComplete;
import com.tn.order.model.vo.OrderBookListVO;
import com.tn.order.model.vo.OrderBookVO;
import com.tn.order.model.vo.OrderDetailVO;
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
	// 주문한 책 수량만큼 북리스트 업데이트
	void updateBook(List<PaymentInfoVO> bookNo);
	
	// 주문한 책리스트 SELECT
//	List<OrderBookListVO> selectBookList(List<String> bookNos);

// -----------------------------------------박근영-------------------------------------------------	

// -----------------------------------------엄영준-------------------------------------------------	
  List<OrderBookVO> selectRecentOrderList(MemberDTO loginMember)throws Exception;
  
  List<OrderVO> selectMyPageOrderList(MemberDTO loginMember)throws Exception;
  List<OrderDetailVO> selectDetailOrder(String orderNo)throws Exception;
  int updateOrderCancel(List<String> ckArr)throws Exception;
// -----------------------------------------엄영준-------------------------------------------------	
  
//-----------------------------------------최미설-------------------------------------------------
  // 배송완료 주문건 가져오기
  OrderVO getSinOrder(String userId);
  
  // 포인트 업데이트
  int updatePoint(String userId, int plannedPoint) throws Exception;
  
  // 포인트로그 추가
  int recordPointLog(String userId, int plannedPoint, int orderNo) throws Exception;
  
  // 탈퇴회원 주문건 업데이트
  int updateUnregisterInfo(String deletedMember) throws Exception;
  
  // 탈퇴요청 회원의 주문건을 확인해서 주문이 없거나 배송완료되었을 때만 탈퇴가 진행되도록 한다.
  List<OrderVO> checkRemainOrder(String deletedMember) throws Exception;
  
  // 스케줄러 작동시점 이후의 주문건 중 "배송완료"된 주문의 목록을 가져옴
  List<DeliveryComplete> findDeliveriesCompleted(Timestamp time);
  
  // 바로 주문시 책정보 가져오기 위한 메서드
  List<PaymentInfoVO> selectBookNoWithoutCartId(PaymentInfoDTO paymentInfoDTO) throws Exception;
  
  
//-----------------------------------------최미설-------------------------------------------------












  

}
