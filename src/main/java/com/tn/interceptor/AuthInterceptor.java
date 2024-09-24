package com.tn.interceptor;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("auth 인터셉터 preHandle");
		
		boolean goController = false;
		
		
		String destPath = request.getRequestURI();// 로그인 전 이동하려고 했던 곳
		String queryStr = request.getQueryString(); // 쿼리스트링
		System.out.println("--------------------------------------------"+destPath+"--------------------------------------------");
		System.out.println("--------------------------------------------"+queryStr+"--------------------------------------------");
		
		HttpSession sess = request.getSession();
		
		if(sess.getAttribute("loginMember")==null) {
			response.sendRedirect("/member/loginPage");
		}else {
			goController = true;
		}
		
		
		return goController;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession sess = request.getSession();
		if(sess.getAttribute("loginMember")!=null) {
			
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}
	

	
}
