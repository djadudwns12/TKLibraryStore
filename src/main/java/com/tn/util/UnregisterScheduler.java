package com.tn.util;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tn.admin.dao.MemberAdminDAO;
import com.tn.admin.dao.OrderDeliveryDAO;
import com.tn.admin.service.MemberAdminService;
import com.tn.admin.service.ProductAdminService;
import com.tn.order.dao.OrderDAO;
import com.tn.order.model.vo.DeliveryComplete;
import com.tn.order.service.OrderService;
import com.tn.qa.service.QAService;
import com.tn.review.service.ReviewService;

@Component // 컴포넌트로 선언하면 MVC  패턴에 포함은 안되지만 스프링으로 관리하겠다임
@EnableScheduling
public class UnregisterScheduler {

	@Autowired
	private ProductAdminService pService;

	@Autowired
	private QAService qaService;

	@Autowired
	private MemberAdminService mService;
	
	@Autowired
	private MemberAdminDAO mDAO;

	@Autowired
	private ReviewService rService;
	
	@Autowired
	private OrderService oService;	
	
		@Transactional
	    @Scheduled(cron = "0 0 12 * * ?") // 매일 오후 12시 0분 0초에 실행
	    public void withdrawMember() {
	    	
	        System.out.println("============탈퇴요청 회원 삭제 스케줄러 작동================");
	        try {
	    		List<String> delMem =  mService.findExpiredMember();
	    		for(String deleteId : delMem) {
	    			//System.out.println("삭제될 아이디 : " + deleteId);
					// 리뷰삭제
					rService.removeUndefinedReview(deleteId);
					// 문의글 삭제
					qaService.removeUndefinedQA(deleteId);
					// 결제내역 업데이트
					oService.updateUnregisterInfo(deleteId);
					// 사진 삭제
					String imgPath = mService.getMemberInfo(deleteId).getUserImg();
					mService.removeImg(imgPath); 
					// Unregister테이블에서도 삭제 
					mDAO.deleteUnregister(deleteId);
					// 회원정보 삭제
					mService.removeMemberInfo(deleteId);
					
	    		}
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	}
