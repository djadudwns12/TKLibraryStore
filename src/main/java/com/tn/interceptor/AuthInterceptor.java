package com.tn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tn.member.model.vo.MemberVO;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("auth 인터셉터 preHandle" );
		
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

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		// admin페이지로 들어갈때
		System.out.println("AuthInterceptor postHandle 들어옴");
		adminYn(request,modelAndView);
		
		
		
		//super.postHandle(request, response, handler, modelAndView);
	}

	/**
	 * @param request
	 * @param modelAndView
	 * 설명 : 로그인한 사람이 admin인지 확인후 admin이면 관리자 페이지로 이동 아니면 /으로 이동
	 */
	private void adminYn(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("adminYn 들어옴");
		
		MemberVO loginMember = (MemberVO) request.getSession().getAttribute("loginMember");
		
		if(request.getRequestURI().contains("admin")) {
			String viewPage = !loginMember.getUserId().equals("admin") ? "redirect:/" : modelAndView.getViewName();
			modelAndView.setViewName(viewPage);
		}
	}
	

	
}
