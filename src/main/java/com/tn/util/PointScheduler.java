package com.tn.util;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.tn.admin.dao.OrderDeliveryDAO;
import com.tn.order.dao.OrderDAO;
import com.tn.order.model.vo.DeliveryComplete;
import com.tn.order.service.OrderService;

@Component // 컴포넌트로 선언하면 MVC  패턴에 포함은 안되지만 스프링으로 관리하겠다임
@EnableScheduling
public class PointScheduler {

	@Autowired
	private OrderDAO oDao;
	
	@Autowired
	private OrderService oService;
		// 매일 오후 3시에 배송완료 주문을 확인하고 유저의 포인트를 적립
	   @Scheduled(cron = "0 0 15 * * ?") // 매일 오후 3시 0분 0초에 실행
	    public void checkAndUpdateOrderStatus() {
	        System.out.println("============주문 상태 업데이트 스케줄러 작동================");
	        try {
	    		Timestamp time = new Timestamp(System.currentTimeMillis()); // 현재시간
	    		// 배송완료 주문 리스트를 가져옴
	    		List<DeliveryComplete> delCom =  oDao.findDeliveriesCompleted(time);
	    		//System.out.println(delCom.toString());
	    		for(DeliveryComplete del : delCom) {
	    			String userId = del.getOrderWho();
	    			int plannedPoint = del.getPlannedPoint();
	    			int orderNo = del.getOrderPK();
	    			//System.out.println(userId + "/" + plannedPoint + "/" + orderNo);
	    			// Member테이블에 포인트 업데이트
	    			oService.updatePoint(userId, plannedPoint);
	    			// PointLog테이블에 기록
	    			oService.recordPointLog(userId, plannedPoint, orderNo);
	    		}
				
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}

	        
	        
	    }
	}
