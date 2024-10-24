package com.tn.interceptor;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tn.member.model.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	
	 // 금지할 패턴 예시 (SQL 인젝션에 자주 사용되는 키워드들)
    private static final String[] SQL_INJECTION_KEYWORDS = { 
        "SELECT", "INSERT", "UPDATE", "DELETE", "DROP", "--", ";", "'",
        "OR ",
        "CREATE",
	      "EXEC",
	      "UNION",
	      "FETCH",
	      "DECLARE",
	      "TRUNCATE"
    };
	

	// 컨트롤러로 이동하기전 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean isLoginPageShow = false; // 컨트롤러로 보낼지 여부 결정변수
		// 로그인 버튼을 눌러서 들어왔는가? + 로그인하는 곳으로 이동하는것인가?
		
		
		 // 모든 파라미터 값을 검사
        for (Object param : request.getParameterMap().keySet()) {
            String[] values = request.getParameterValues(param.toString());
            for (String value : values) {
                if (containsSQLInjectionKeywords(value)) {
                    // SQL 인젝션이 의심되는 입력일 경우 요청을 차단
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "SQL Injection detected.");
                    return false; // 요청 처리 중단
                }
            }
        }
        
		if(request.getMethod().toUpperCase().equals("GET")) {
			// 이전에 접속하던 페이지 페이지가 있다면 페이지를 얻어오기 
			
			// System.out.println(request.getHeader("referer"));
			// destPath가 없다면 이전페이지로 설정하는 코드
			if(request.getSession().getAttribute("destPath") == null && !request.getHeader("referer").contains("member/register")) {				
				request.getSession().setAttribute("destPath", request.getHeader("referer"));
			}
			
			if(request.getParameter("redirectUri") != null) {
				String redirectUri =(String)request.getParameter("redirectUri");
				request.getSession().setAttribute("destPath", redirectUri);
				
			}
			// 로그인 하지 않은경우 로그인 페이지를 보여준다. 
			if(request.getSession().getAttribute("loginMember") == null) { 					
				isLoginPageShow = true;
			}else {//이미 로그인 한경우 로그인 페이지를 보여주지 않는다.
				isLoginPageShow = false;
				// System.out.println("이미 로그인 하셨습니다.");
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
		// System.out.println("Login인터셉터 -postHandle 부른다.");
		
		HttpSession sess = request.getSession();
		if(request.getMethod().toUpperCase().equals("POST")) {
			
			MemberVO loginMember =(MemberVO) sess.getAttribute("loginMember");
			
			if(loginMember != null) { // 로그인 성공시
				
				Object tmp = sess.getAttribute("destPath");
				
				// System.out.println((String) tmp);
				
				String viewName = ((tmp == null) ? "/" : (String) sess.getAttribute("destPath"));
//				modelAndView.addObject("status", "loginSuccess");
				
				if(viewName.contains("admin")) {
					viewName = !loginMember.getUserId().equals("admin") ? "/" : viewName; 
				}
				
				modelAndView.setViewName("redirect:"+viewName);
				
				// System.out.println(modelAndView.getViewName());
			}else if(sess.getAttribute("loginMember") == null) {
				//modelAndView.addObject("status", "loginFail");
				modelAndView.setViewName("member/loginPage");
			}
		
		
			
		}
		super.postHandle(request, response, handler, modelAndView);
	}
	
	// SQL 인젝션 키워드가 포함되어 있는지 검사
    private boolean containsSQLInjectionKeywords(String input) {
        if (input == null) return false;
        for (String keyword : SQL_INJECTION_KEYWORDS) {
            if (input.toUpperCase().contains(keyword)) {
                return true;
            }
        }
        return false;
    }

	
}
