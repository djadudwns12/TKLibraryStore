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
	public List<AddressVO> selectAddress(String userId) {
		return ses.selectList(NS + ".selectUserAddress", userId);
	}

	@Override
	public int selectPoint(String userId) {
		return ses.selectOne(NS + ".selectUserPoint", userId);
	}

	@Override
	public int insertPaymentInfo(PaymentInfoDTO paymentInfoDTO) {
		return ses.insert(NS + ".insertPaymentComplete", paymentInfoDTO);
	}

	@Override
	public List<PaymentInfoVO> selectBookNo(PaymentInfoDTO paymentInfoDTO) {
		System.out.println("DTO 확인: " + paymentInfoDTO);
		System.out.println("cartId 확인: " + paymentInfoDTO.getCartId());
		return ses.selectList(NS + ".selectOrderBookNo" , paymentInfoDTO);
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
