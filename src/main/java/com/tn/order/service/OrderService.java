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
	boolean paymentInfoApply(PaymentInfoDTO paymentInfoDTO);
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
	
// -----------------------------------------최미설-------------------------------------------------
	// 포인트 업데이트할 주문건 가져오기
	OrderVO getSinOrder(String userId) throws Exception;	
	// 포인트 업데이트
	boolean updatePoint(String userId, OrderVO sinOrder) throws Exception;
	// 포인트로그 추가
	boolean recordPointLog(String userId, OrderVO sinOrder) throws Exception;
	// 탈퇴회원 주문정보 업데이트
	boolean updateUnregisterInfo(String deletedMember) throws Exception;
	// 회원탈퇴시 남아있는 주문을 확인하는 메서드
	boolean checkRemainOrder(String deletedMember) throws Exception;

//-----------------------------------------최미설-------------------------------------------------
	
}
