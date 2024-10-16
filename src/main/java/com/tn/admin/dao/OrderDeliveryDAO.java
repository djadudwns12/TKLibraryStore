package com.tn.admin.dao;

import java.util.List;

import com.tn.admin.model.vo.CancelOrderMemberVO;
import com.tn.admin.model.vo.CancelOrderVO;

import com.tn.admin.model.vo.OrderDeliveryVO;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.SearchCriteriaDTO;


public interface OrderDeliveryDAO {
//-----------------------------------------박근영-------------------------------------------------
	void updateOrderStatus(List<String> orderNos) throws Exception;
	


	List<CancelOrderVO> selectOrderInfo(List<String> orderNos) throws Exception;
	
	List<CancelOrderMemberVO> selectMemberInfo(List<CancelOrderVO> orderInfo) throws Exception;
	
	void updateMemberPoints(CancelOrderMemberVO member) throws Exception;
	
	void deletePointLog(List<CancelOrderVO> orderInfo) throws Exception;
	
	
	
	
	List<OrderDeliveryVO> selectOrderDeliveryInfo(PagingInfo pi);
	
	
	
	
	

	List<OrderDeliveryVO> selectOrderDeliveryInfoWithSort(PagingInfo pi, String sortBy);
	List<OrderDeliveryVO> selectAllOrderDelivery(PagingInfo pi, SearchCriteriaDTO searchCriteria);
	
	
	

	

	List<OrderDeliveryVO> selectAllOrderDelivery(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy);
	
	
	
	
	int getTotalOrderCount() throws Exception; // 전체 주문 수를 가져오는 메서드
    int getTotalOrderCount(SearchCriteriaDTO searchCriteria) throws Exception; // 검색 조건에 따른 주문 수를 가져오는 메서드

//-----------------------------------------박근영-------------------------------------------------


	

	

	

	

	
}
