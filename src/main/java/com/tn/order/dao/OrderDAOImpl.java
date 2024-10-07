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

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	private SqlSession ses;
	
	private String NS = "com.tn.mapper.orderMapper";
	
	
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
		return ses.insert(NS + ".insertPaymentComplete");
	}

	@Override
	public List<PaymentInfoVO> selectBookNo(PaymentInfoDTO paymentInfoDTO) {
		return ses.selectList(NS + ".selectOrderBookNo" , paymentInfoDTO);
	}

//	@Override
//	public List<OrderBookListVO> selectBookList(List<String> bookNos) {
//		
//		return ses.selectList(NS + ".selectOrderBookList", bookNos);
//	}
//-----------------------------------------박근영-------------------------------------------------



}
