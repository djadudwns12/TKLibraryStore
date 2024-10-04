package com.tn.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;
import com.tn.order.dao.OrderDAO;
import com.tn.order.model.vo.OrderVO;

import lombok.RequiredArgsConstructor;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO oDao;
	
	
	@Override
	public List<BooklistVO> getOrderList(MemberDTO loginMember)throws Exception {
		
		return oDao.selectOrderList(loginMember);
	}
	
}
