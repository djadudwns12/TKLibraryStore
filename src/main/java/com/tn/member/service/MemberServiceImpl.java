package com.tn.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tn.member.dao.MemberDAO;
import com.tn.member.model.vo.MemberVO;

import java.io.IOException;
import java.util.Random;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import com.tn.util.PropertiesTask;
import lombok.RequiredArgsConstructor;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	@Autowired
  private MemberDAO dao;
	
  final DefaultMessageService messageService;
  
  public MemberServiceImpl() throws IOException {
        this.messageService = NurigoApp.INSTANCE.initialize(PropertiesTask.getPropertiesValue("coolSmsKey"), PropertiesTask.getPropertiesValue("coolSmsSecret"), "https://api.coolsms.co.kr");
  }  
	
  @Override
	@Transactional(readOnly = true)
	public List<Map<String, String>> getMember() {
		// TODO Auto-generated method stub
		return dao.getMember();
	}

	@Override
	public MemberVO getEditMemberInfo(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO loginMember(String userId, String userPwd) throws Exception {
		
		return dao.getMember(userId,userPwd);
	}
  
	@Override
	public ResponseEntity<Integer> sendOne(String phone) throws Exception {
		System.out.println("샌드원 확인");
		Message message = new Message();
		message.setFrom("010-3888-9567");
        message.setTo(phone);
        
        int code = createCode();
        message.setText("떡잎서점 - 회원가입 인증번호는(" + code + ")입니다. 정확히 입력해 주세요.");
        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);
        
        if (response.getStatusCode().equals("2000")) {
        	return new ResponseEntity<Integer>(code, HttpStatus.OK);
        }else {
        	
        	return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        	
		
	}
		
	private int createCode() {
        // 간단한 예시로 6자리 숫자 코드 생성
		//0.0(포함)부터 1.0(제외)
        //int code = (int) (Math.random() * 900000) + 100000;
        Random random = new Random();
        //0부터 899,999
        int code = 100000 + random.nextInt(900000); 
        return code;
    }
		



}
