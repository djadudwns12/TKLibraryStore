package com.tn.member.controller;





import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	
	
	@RequestMapping(value="/getAddr") 
	public void getAddrApi(HttpServletRequest req, HttpServletResponse response){ 
	    try {
	        // 요청변수 설정 
	        String currentPage = "1"; 
	        String countPerPage = "10"; 
	        String resultType = "json"; 
	        String confmKey = PropertiesTask.getPropertiesValue("jusoConfmKey");  // IOException 발생 가능
	        String keyword = req.getParameter("keyword"); 

	        // API 호출 URL 정보 설정 
	        String apiUrl = "https://business.juso.go.kr/addrlink/addrLinkApi.do?currentPage=" + currentPage +
	                        "&countPerPage=" + countPerPage + 
	                        "&keyword=" + URLEncoder.encode(keyword, "UTF-8") + 
	                        "&confmKey=" + confmKey + 
	                        "&resultType=" + resultType; 

	        URL url = new URL(apiUrl);  
	        BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8")); 
	        StringBuffer sb = new StringBuffer(); 
	        String tempStr = null; 
	        while ((tempStr = br.readLine()) != null) { 
	            sb.append(tempStr);  // 응답결과 JSON 저장  
	        } 
	        br.close(); 
	        response.setCharacterEncoding("UTF-8"); 
	        response.setContentType("text/xml"); 
	        response.getWriter().write(sb.toString()); // 응답결과 반환 
	    } catch (IOException e) {
	        e.printStackTrace();  // IOException을 처리
	        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);  // 에러 상태를 반환
	    }
	}

	
	
	
		   
	
}
