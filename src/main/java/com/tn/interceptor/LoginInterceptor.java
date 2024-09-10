package com.tn.interceptor;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	// 컨트롤러로 이동하기전 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean isLoginPageShow = false; // 컨트롤러로 보낼지 여부 결정변수
		// 로그인 버튼을 눌러서 들어왔는가? + 로그인하는 곳으로 이동하는것인가?
		if(request.getMethod().toUpperCase().equals("GET")) {
			// 이전에 접속하던 페이지 페이지가 있다면 페이지를 얻어오기 
			if(request.getParameter("redirectUri") != null) {
				String redirectUri =(String)request.getParameter("redirectUri");
			}
			// 로그인 하지 않은경우 로그인 페이지를 보여준다. 
			if(request.getSession().getAttribute("loginMember") == null) { 					
				isLoginPageShow = true;
			}else {//이미 로그인 한경우 로그인 페이지를 보여주지 않는다.
				isLoginPageShow = false;
				System.out.println("이미 로그인 하셨습니다.");
			}
		
		}else if(request.getMethod().toUpperCase().equals("POST")){ // 로그인 페이지에서 로그인 버튼을 누른경우
			isLoginPageShow = true;
		}
		
		
		
		
		return isLoginPageShow;
	}
	// 컨트롤러 갔다온후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle 부른다.");
		
		HttpSession sess = request.getSession();
		if(request.getMethod().toUpperCase().equals("POST")) {
			if(sess.getAttribute("loginMember") != null) { // 로그인 성공시
				// 처음 화면으로 보냄
				modelAndView.setViewName("index");
				modelAndView.addObject("status", "success");
			}else if(sess.getAttribute("loginMember") == null) {
				modelAndView.addObject("status", "fail");
				modelAndView.setViewName("member/loginPage");
			}
		
		
			
		}
		
		
		
		//super.postHandle(request, response, handler, modelAndView);
	}

	
}
