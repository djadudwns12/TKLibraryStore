package com.tn.order.dao;

import org.springframework.stereotype.Repository;

import com.tn.member.model.dto.MemberDTO;
import com.tn.order.model.dto.OrderDTO;

@Repository
public interface OrderDAO {

	// 멤버테이블에 포인트 업데이트
	int updatePoint(String userId, String orderNo) throws Exception;

	// 포인트로그테이블에 기록
	int insertPointLog(OrderDTO orderDTO) throws Exception;

}
