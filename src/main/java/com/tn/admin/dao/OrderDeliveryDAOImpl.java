package com.tn.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.admin.model.vo.CancelOrderMemberVO;
import com.tn.admin.model.vo.CancelOrderVO;
import com.tn.admin.model.vo.OrderDeliveryVO;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.SearchCriteriaDTO;

@Repository
public class OrderDeliveryDAOImpl implements OrderDeliveryDAO {

	
	@Autowired
	private SqlSession ses;
	
	private String NS = "com.tn.mapper.OrderDeliveryAdminMapper";

//-----------------------------------------박근영-------------------------------------------------
	@Override
	public void updateOrderStatus(List<String> orderNos) throws Exception {
		ses.update(NS + ".updateOrderStatus", orderNos);
		
	}
	
	@Override
	public List<OrderDeliveryVO> selectOrderDeliveryInfo(PagingInfo pi) {
		System.out.println("selectOrderDeliveryInfo전 확인"+pi);
		System.out.println(ses.selectList(NS + ".selectOrderDeliveryInfo", pi));
		return ses.selectList(NS + ".selectOrderDeliveryInfo", pi);

	}
	
	@Override
	public List<CancelOrderVO> selectOrderInfo(List<String> orderNos) throws Exception {
		
		return ses.selectList(NS + ".selectOrderInfo", orderNos);
	}
	
	@Override
	public List<CancelOrderMemberVO> selectMemberInfo(List<CancelOrderVO> orderInfo) throws Exception {
		
		return ses.selectList(NS + ".selectMemberInfo", orderInfo);
	}
	
	@Override
	public void updateMemberPoints(CancelOrderMemberVO member) throws Exception {
		ses.update(NS + ".updateMemberPoints", member);
		
	}
	
	@Override
	public void deletePointLog(List<CancelOrderVO> orderInfo) throws Exception {
		ses.delete(NS + ".deletePointLog", orderInfo);
		
	}


	@Override
	public List<OrderDeliveryVO> selectOrderDeliveryInfoWithSort(PagingInfo pi, String sortBy) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("pagingInfo", pi);
	    paramMap.put("sortBy", sortBy);
	    return ses.selectList(NS + ".selectOrderDeliveryInfoWithSort", paramMap);
	}
	
	
	@Override
	public List<OrderDeliveryVO> selectAllOrderDelivery(PagingInfo pi, SearchCriteriaDTO searchCriteria) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("pagingInfo", pi);
	    paramMap.put("searchCriteria", searchCriteria);
	    return ses.selectList(NS + ".selectAllOrderDelivery", paramMap);
	}
	
	@Override
	public List<OrderDeliveryVO> selectAllOrderDelivery(PagingInfo pi, SearchCriteriaDTO searchCriteria, String sortBy) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("pagingInfo", pi);
	    paramMap.put("searchCriteria", searchCriteria);
	    paramMap.put("sortBy", sortBy);
	    return ses.selectList(NS + ".selectAllOrderDeliveryWithSort", paramMap);
	}
	
	
	
	
	
	




	
	 @Override
	    public int getTotalOrderCount() throws Exception {
	        return ses.selectOne(NS + ".getTotalOrderCount");
	    }

	    @Override
	    public int getTotalOrderCount(SearchCriteriaDTO searchCriteria) throws Exception {
	        return ses.selectOne(NS + ".getTotalOrderCountWithSearch", searchCriteria);
	    }

//-----------------------------------------박근영-------------------------------------------------










}
