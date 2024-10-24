package com.tn.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tn.admin.dao.OrderDeliveryDAO;
import com.tn.admin.model.vo.CancelBookInvenVO;
import com.tn.admin.model.vo.CancelOrderMemberVO;
import com.tn.admin.model.vo.CancelOrderVO;
import com.tn.admin.model.vo.OrderDeliveryVO;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.SearchCriteriaDTO;

@Service
public class OrderDeliveryServiceImpl implements OrderDeliveryService {
	
	@Autowired
	private OrderDeliveryDAO odDao;
	
//-----------------------------------------박근영-------------------------------------------------

	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void cancelOrder(List<String> orderNos) throws Exception {
		// 주문번호로 사용한 포인트 및 pk , userId 가져오기, member에서 총 구입액, 사용자 포인트가져오기, 사용한포인트와 사용자포인트 합쳐서 insert,
		// pk를 가지고 포인트 로그의 why와 매칭하여 삭제
		odDao.updateOrderStatus(orderNos);
		List<CancelBookInvenVO> cancelBookInfo = odDao.selectBooks(orderNos);
		odDao.reStock(cancelBookInfo);
		
		List<CancelOrderVO> orderInfo= odDao.selectOrderInfo(orderNos);
		
		// 취소 주문 정보를 유저 ID로 그룹화한 정보
		Map<String, List<CancelOrderVO>> groupedByUser = orderInfo.stream()
			    .collect(Collectors.groupingBy(CancelOrderVO::getOrderWho));
		

		//orderInfo.addAll(obDao.selectMemberInfo(orderInfo));
		List<CancelOrderMemberVO> memberInfo = odDao.selectMemberInfo(orderInfo);

		Map<String, CancelOrderMemberVO> memberInfoMap = memberInfo.stream()
			    .collect(Collectors.toMap(CancelOrderMemberVO::getUserId, member -> member));

		// 순회하면서(키,값) 지정
		groupedByUser.forEach((userId, cancelOrders) -> {
		    // 해당 유저의 현재 포인트 정보 가져오기
			CancelOrderMemberVO member = memberInfoMap.get(userId);

		    if (member != null) {
		        // 돌려줘야 할 포인트 합산
		    	//.mapToInt(order -> Integer.parseInt(order.getUsePoint()))
		        int totalRefundPoints = cancelOrders.stream()
		            .mapToInt(CancelOrderVO::getUsePoint)
		            .sum();
		        int totalRefundPay = cancelOrders.stream()
		        		.mapToInt(CancelOrderVO::getTotalPay).sum();

		        member.setUserPoint(member.getUserPoint() + totalRefundPoints);
		        member.setUserTotalPay(member.getUserTotalPay() - totalRefundPay);
		        
		        try {
                    // 특정 메서드만 트라이-캐치로 감싸기
                    odDao.updateMemberPoints(member);
                } catch (Exception e) {
                    // 예외가 발생하면 전체 트랜잭션이 롤백되도록 다시 예외를 던집니다.
                    throw new RuntimeException("Failed to update member points for user: " + userId, e);
                }
		    }
		});
		
		odDao.deletePointLog(orderInfo);
		
		
	
		// System.out.println(orderInfo);
	}
	
	@Override
	@Transactional
	public Map<String, Object> listAllOrderDelivery(PagingInfoDTO dto, SearchCriteriaDTO searchCriteria, String sortBy) throws Exception {
	    Map<String, Object> resultMap = new HashMap<String, Object>();
	    List<OrderDeliveryVO> list = null;
	    PagingInfo pi = makePagingInfo(dto, searchCriteria);

	    if (searchCriteria.getSearchType() == null || searchCriteria.getSearchWord() == null ||
	        searchCriteria.getSearchType().isEmpty() || searchCriteria.getSearchWord().isEmpty()) {
	        if (sortBy.equals("default")) {
	            list = odDao.selectOrderDeliveryInfo(pi); // 주문 목록 가져오기
	        } else {
	            list = odDao.selectOrderDeliveryInfoWithSort(pi, sortBy);
	        }
	    } else {
	        if (sortBy.equals("default")) {
	            list = odDao.selectAllOrderDelivery(pi, searchCriteria);
	        } else {
	            list = odDao.selectAllOrderDelivery(pi, searchCriteria, sortBy);
	        }
	    }

	    resultMap.put("pagingInfo", pi);
	    resultMap.put("orderList", list);
	    // System.out.println("리설트 맵 : "+resultMap);
	    return resultMap;
	}
	
	private PagingInfo makePagingInfo(PagingInfoDTO dto, SearchCriteriaDTO sc) throws Exception {
	    PagingInfo pi = new PagingInfo(dto);

	    // 검색어가 없을 때는 전체 데이터 수를 얻어오는 것부터 페이징 시작
	    if (sc.getSearchType() == null || sc.getSearchWord() == null ||
	        sc.getSearchType().isEmpty() || sc.getSearchWord().isEmpty()) {
	        // 전체 데이터 수 세팅
	    	List<OrderDeliveryVO> orderCount = odDao.getTotalOrderCount();
	    	int orderWithoutSearchCount = orderCount.size();
	    			// System.out.println("총 페이지 수"+orderWithoutSearchCount);
	        pi.setTotalPostCnt(orderWithoutSearchCount);
	    } else {
	        // 검색어가 있을 때는 검색한 데이터 수를 얻어오는 것부터 페이징 시작
	    	// System.out.println(sc.getSearchType() + "   " + sc.getSearchWord());
	    	List<OrderDeliveryVO> orderWithSearchCount = odDao.getTotalOrderSearchCount(sc);
	    	
	    	int orderSearchCount = orderWithSearchCount.size();
	    	// System.out.println("총 페이지 수"+orderSearchCount);
	        pi.setTotalPostCnt(orderSearchCount);
	    }

	    // 페이징 정보 설정
	    pi.setTotalPageCnt();        // 전체 페이지 수 세팅
	    pi.setStartRowIndex();       // 현재 페이지에서 보여주기 시작할 rowIndex 세팅
	    pi.setPageBlockNoCurPage();  // 현재 페이지가 속한 페이지 블럭 설정
	    pi.setStartPageNoCurBlock(); // 현재 블럭의 시작 페이지 번호 설정
	    pi.setEndPageNoCurBlock();   // 현재 블럭의 끝 페이지 번호 설정
	    // System.out.println(pi);
	    return pi;
	}

	
	

//-----------------------------------------박근영-------------------------------------------------



}
