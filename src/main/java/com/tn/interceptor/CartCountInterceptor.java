package com.tn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tn.cart.service.CartService;
import com.tn.member.model.vo.MemberVO;

public class CartCountInterceptor implements HandlerInterceptor {

    @Autowired
    private CartService cService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");

        int cartCount = 0;
        if (loginMember != null) {
            String userId = loginMember.getUserId();
            cartCount = cService.getCartCnt(userId);
        }

        request.setAttribute("CartCnt", cartCount); // 모든 페이지에서 사용할 수 있도록 설정
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (modelAndView != null) {
            modelAndView.addObject("CartCnt", request.getAttribute("CartCnt")); // 모델에 추가
        }
    }

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}