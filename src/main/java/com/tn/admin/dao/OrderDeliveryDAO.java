package com.tn.admin.dao;

import java.util.List;

import com.tn.admin.model.vo.OrderDeliveryVO;

public interface OrderDeliveryDAO {

	List<OrderDeliveryVO> selectOrderDeliveryInfo();

}
