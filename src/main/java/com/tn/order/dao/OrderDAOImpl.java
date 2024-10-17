package com.tn.order.dao;


import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.order.model.dto.PaymentInfoDTO;
import com.tn.order.model.vo.AddressVO;
import com.tn.order.model.vo.OrderBookListVO;
import com.tn.order.model.vo.OrderDetailVO;
import com.tn.order.model.vo.PaymentInfoVO;
import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;
import com.tn.order.model.vo.OrderVO;


@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	private SqlSession ses;

	
	private String NS = "com.tn.mapper.OrderMapper";
	
	
//-----------------------------------------박근영-------------------------------------------------
	@Override
	public List<AddressVO> selectAddress(String userId) throws Exception {
		return ses.selectList(NS + ".selectUserAddress", userId);
	}

	@Override
	public int selectPoint(String userId) throws Exception {
		return ses.selectOne(NS + ".selectUserPoint", userId);
	}

	@Override
	public void insertPaymentInfo(PaymentInfoDTO paymentInfoDTO) throws Exception {
		ses.insert(NS + ".insertPaymentComplete", paymentInfoDTO);
	}

	@Override
	public List<PaymentInfoVO> selectBookNo(PaymentInfoDTO paymentInfoDTO) throws Exception {
		System.out.println("DTO 확인: " + paymentInfoDTO);
		System.out.println("cartId 확인: " + paymentInfoDTO.getCartId());
		return ses.selectList(NS + ".selectOrderBookNo" , paymentInfoDTO);
	}
	
	@Override
	public void insertBooks(List<PaymentInfoVO> bookNo) throws Exception {
		ses.insert(NS + ".insertOrderBooks", bookNo);
		
	}
	
	@Override
	public void updatePoint(PaymentInfoDTO paymentInfoDTO) throws Exception {
		ses.update(NS + ".insertUserPoint", paymentInfoDTO);
		
	}
	
	@Override
	public void insertUsePoint(PaymentInfoDTO paymentInfoDTO) throws Exception {
		System.out.println(paymentInfoDTO.getPaymentId());
		ses.insert(NS + ".insertUsePointLog", paymentInfoDTO);
		
	}
	@Override
	public void deleteCart(PaymentInfoDTO paymentInfoDTO) throws Exception {
		ses.delete(NS + ".deleteReflectCart" ,paymentInfoDTO);
		
	}
	@Override
	public PaymentInfoVO selectTotalPay(PaymentInfoDTO paymentInfoDTO) throws Exception {
		return ses.selectOne(NS + ".selectUserTotalPay", paymentInfoDTO);
		
	}
	@Override
	public void updateTotalPay(PaymentInfoDTO paymentInfoDTO) throws Exception {
		ses.update(NS + ".updateUserTotalPay", paymentInfoDTO);
		
	}
	
	@Override
	public void updateOrdersToShipping() {
		// safe 모드로 인하여 AND orderNo IS NOT NULL 추가
		ses.update(NS + ".updateOrdersToShipping");
		
	}
	
	@Override
	public void updateOrdersToDelivered() {
		ses.update(NS + ".updateOrdersToDelivered");
		
	}
	
	@Override
	public void updateBook(List<PaymentInfoVO> bookNo) {

		List<Map<String, Integer>> bookMapList = new ArrayList<>();

	    // 각 PaymentInfoVO 객체에서 필요한 정보를 Map으로 변환
	    for (PaymentInfoVO book : bookNo) {
	        Map<String, Integer> bookMap = new HashMap<>();
	        
	        // bookNo와 qty 값 가져오기
	        String qtyStr = book.getQty();  // qty는 String 형태
	        int qty = Integer.parseInt(qtyStr.trim());  // 문자열을 숫자로 변환
	        System.out.println(qty);
	        System.out.println(book.getBookNo());
	        bookMap.put("bookNo", book.getBookNo());
	        bookMap.put("qty", qty);
	        
	        bookMapList.add(bookMap);
	    }

	    // 변환된 List<Map>을 MyBatis로 전달
	    ses.update(NS + ".updateBookNo", bookMapList);
		
	}


//	@Override
//	public List<OrderBookListVO> selectBookList(List<String> bookNos) {
//		
//		return ses.selectList(NS + ".selectOrderBookList", bookNos);
//	}
//-----------------------------------------박근영-------------------------------------------------

//-----------------------------------------엄영준-------------------------------------------------
	@Override
	public List<BooklistVO> selectRecentOrderList(MemberDTO loginMember) throws Exception {
		
		return ses.selectList(NS+".selectRecentOrderList", loginMember);
	}

	@Override
	public List<OrderVO> selectMyPageOrderList(MemberDTO loginMember) {
		// TODO Auto-generated method stub
		return ses.selectList(NS+".selectMyPageOrderList", loginMember);
	}

	@Override
	public List<OrderDetailVO> selectDetailOrder(String orderNo) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectList(NS+".selectDetailOrder", orderNo);
	}

	@Override
	public int updateOrderCancel(List<String> ckArr) throws Exception {
		return ses.update(NS+".updateOrderCancel", ckArr);
	}
	
	
	
	
	
	
	
//-----------------------------------------엄영준-------------------------------------------------


//-----------------------------------------최미설-------------------------------------------------
	@Override
	public int updatePoint(String userId, OrderVO sinOrder) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		params.put("orderNo", sinOrder.getOrderNo());
		
		return ses.update(NS + ".updatePoint", params);
	}
	
	@Override
	public OrderVO getSinOrder(String userId) {
		return ses.selectOne(NS + ".getSinOrder", userId);
	}
		
	@Override
	public int recordPointLog(String userId, OrderVO sinOrder) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		params.put("pWhy", sinOrder.getOrderNo());
		params.put("pScore", sinOrder.getPlannedPoint());
		
		return ses.insert(NS + ".recordPointLog", params);
	}	
	

	@Override
	public int updateUnregisterInfo(String deletedMember) throws Exception {
		return ses.update(NS + ".updateUnregisterInfo", deletedMember);
	}

	@Override
	public List<OrderVO> checkRemainOrder(String deletedMember) throws Exception {
		return ses.selectList(NS + ".checkRemainOrder", deletedMember);
	}
//-----------------------------------------최미설-------------------------------------------------

}
