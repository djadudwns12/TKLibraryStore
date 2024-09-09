package com.tn.member.controller;





import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	

	@RequestMapping(value="/register")
	   public String registerMember() {
		
			return "register";
		}
	
	
	
	
	
//////////////////////////////////박근영///////////////////////////////////////
	
//	@RequestMapping("/coolsms")
//	public String CoolsmsController {
//		   final DefaultMessageService messageService;
//
//		    public void CoolsmsController() {
//		        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
//		        this.messageService = NurigoApp.INSTANCE.initialize("NCSIFSCSZASSG9F9", "UZ8YAMBTCSGFQUVBFEPPDFCWHAOZRZDP", "https://api.coolsms.co.kr");
//		    }
//
//		    @PostMapping("/send-one")
//		    public SingleMessageSentResponse sendOne(@RequestParam("mobile") String mobile) {
//		        Message message = new Message();
//		        
//		        message.setFrom("010-3888-9567");
//		        message.setTo(mobile);
//		        ValidationUtil validationUtil = new ValidationUtil();
//		        int code = validationUtil.createCode();
//		        message.setText("인증번호는(" + code + ")입니다. 정확히 입력해 주세요.");
//
//		        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
//		        System.out.println(response);
//
//		        return response;
//		    }
//
//
//		}
//
//	class ValidationUtil {
//
//	    // 인증 코드를 생성하는 메소드
//	    public int createCode() {
//	        // 간단한 예시로 6자리 숫자 코드 생성
//	        //int code = (int) (Math.random() * 900000) + 100000;
//	        Random random = new Random();
//	        int code = 100000 + random.nextInt(900000);
//	        return code;
//	    }
//	}
//	
	
}
