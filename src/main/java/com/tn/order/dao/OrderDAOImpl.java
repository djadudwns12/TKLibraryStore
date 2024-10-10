package com.tn.order.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.member.model.dto.MemberDTO;
import com.tn.order.model.dto.OrderDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	private SqlSession ses;
	private String NS = "com.tn.mapper.OrderMapper";

	@Override
	public int updatePoint(String userId, String orderNo) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("orderNo", orderNo);
		
		return ses.update(NS + ".updatePoint", params);
	}

	@Override
	public int insertPointLog(OrderDTO orderDTO) throws Exception {
		return ses.insert(NS+".insertPointLog", orderDTO);
	}

}
