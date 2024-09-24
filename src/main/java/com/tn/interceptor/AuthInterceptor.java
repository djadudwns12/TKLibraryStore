package com.tn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("auth 인터셉터 preHandle");
		
		boolean goController = false; // 컨트롤러로 보낼지를 결정하는 변수
		
		
		new DestiationPath().setDestPath(request); // 로그인 하기전 호출했던 페이지를 저장
		
		HttpSession sess = request.getSession();
		
		if(sess.getAttribute("loginMember")==null) { // 로그인이 되지 않은경우
			// 로그인 페이지로 보내기
			response.sendRedirect("/member/loginPage");
		}else { // 로그인을 한경우
			goController = true;
		}
		
		
		return goController;
	}
	

	
}
