package com.tn.order.dao;


import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.order.model.dto.PaymentInfoDTO;
import com.tn.order.model.vo.AddressVO;
import com.tn.order.model.vo.OrderBookListVO;
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


//	@Override
//	public List<OrderBookListVO> selectBookList(List<String> bookNos) {
//		
//		return ses.selectList(NS + ".selectOrderBookList", bookNos);
//	}
//-----------------------------------------박근영-------------------------------------------------

//-----------------------------------------엄영준-------------------------------------------------
	@Override
	public List<BooklistVO> selectOrderList(MemberDTO loginMember) throws Exception {
		
		return ses.selectList(NS+".selectOrderList", loginMember);
	}
//-----------------------------------------엄영준-------------------------------------------------
















}
