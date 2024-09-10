package com.tn.member.controller;





import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tn.member.service.MemberService;
import com.tn.util.PropertiesTask;

import lombok.RequiredArgsConstructor;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService mService;
	
	

	@RequestMapping(value="/register")
	   public String registerMember() {
		
			return "register";
		}
	
	
	@RequestMapping(value = "/coolsms" , method = RequestMethod.POST)
	public ResponseEntity<Integer> coolSms(@RequestParam("phone") String phone) {
		System.out.println("컨트롤 확인");
		try {
			return mService.sendOne(phone);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(-1);  // -1로 에러 표시
		}
		
		
		
	}
		   
	
}
