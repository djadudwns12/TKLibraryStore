package com.tn.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.admin.model.vo.OrderDeliveryVO;

@Repository
public class OrderDeliveryDAOImpl implements OrderDeliveryDAO {

	
	@Autowired
	private SqlSession ses;
	
	private String NS = "com.tn.mapper.OrderDeliveryAdminMapper";

//-----------------------------------------박근영-------------------------------------------------
	@Override
	public List<OrderDeliveryVO> selectOrderDeliveryInfo() {
		
		return ses.selectList(NS + ".selectOrderDeliveryInfo");

	}
//-----------------------------------------박근영-------------------------------------------------
}