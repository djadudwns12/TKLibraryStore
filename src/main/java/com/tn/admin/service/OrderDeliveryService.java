package com.tn.admin.service;

import java.util.List;
import java.util.Map;

import com.tn.admin.model.vo.OrderDeliveryVO;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.SearchCriteriaDTO;

public interface OrderDeliveryService {
//-----------------------------------------박근영-------------------------------------------------
	// 주문정보 불러오기
	//List<OrderDeliveryVO> orderDeliveryInfo() throws Exception;
	// 주문취소하기
	void cancelOrder(List<String> orderNos) throws Exception;
	
	Map<String, Object> listAllOrderDelivery(PagingInfoDTO dto, SearchCriteriaDTO searchCriteria, String sortBy) throws Exception;
//-----------------------------------------박근영-------------------------------------------------
	
	

}
