package com.tn.admin.dao;

import java.util.List;

import com.tn.admin.model.vo.CancelOrderVODTO;
import com.tn.admin.model.vo.OrderDeliveryVO;


public interface OrderDeliveryDAO {
//-----------------------------------------박근영-------------------------------------------------
	List<OrderDeliveryVO> selectOrderDeliveryInfo();

	List<CancelOrderVODTO> selectOrderInfo(List<String> orderNos);
//-----------------------------------------박근영-------------------------------------------------
}
