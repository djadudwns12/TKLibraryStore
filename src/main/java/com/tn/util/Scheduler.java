package com.tn.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.tn.order.service.OrderService;

@Component // 컴포넌트로 선언하면 MVC  패턴에 포함은 안되지만 스프링으로 관리하겠다임
@EnableScheduling
public class Scheduler {

	
	   @Autowired
	   private OrderService oService;

	
	   @Scheduled(cron = "0 0 * * * *") // 매 시간마다 실행
	    public void checkAndUpdateOrderStatus() {
	        System.out.println("주문 상태 업데이트 스케줄러 작동");

	        
	        try {
	        	// 하루가 지난 주문 '배송중' 변경
				oService.orderStatusToShipping();
				// 3일이 지난 주문 '배송완료' 변경
				oService.orderStatusToDelivered();
			} catch (Exception e) {
				
				e.printStackTrace();
			}

	        
	        
	    }
	}
