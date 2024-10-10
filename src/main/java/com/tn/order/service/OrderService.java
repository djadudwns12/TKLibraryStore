package com.tn.order.service;

import org.springframework.stereotype.Service;

import com.tn.member.model.dto.MemberDTO;
import com.tn.order.model.dto.OrderDTO;

@Service
public interface OrderService {

	// 결제 후 포인트를 멤버테이블에 업데이트 하는 메서드
	boolean updatePoint(String userId, String orderNo) throws Exception;
	
	// 포인트 로그를 추가하는 메서드
	boolean insertPointLog(OrderDTO orderDTO) throws Exception;
}
