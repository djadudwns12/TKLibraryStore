package com.tn.interceptor;

import javax.servlet.http.HttpServletRequest;

public class DestiationPath {
	private String destPath; // static을 사용하면 변수를 공유하게 된다 그래서 사용하면 안된다.

	/**
	 * @작성자 : 엄영준
	 * @작성일 : 2024. 09. 24.
	 * @클래스명 : MiniProject
	 * @메서드명 : setDestPath
	 * @param HttpServletRequest request : request 객체
	 * @param
	 * @return : void
	 * @description : request객체에서 uri 와 쿼리스트링을 얻어 목적지 경로를 저장하는 객체
	 * 				  세션객체에 바인딩
	 *
	 */
	public void setDestPath(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String queryString = request.getQueryString(); // ? 가 빠진 상태로 반환됨

		this.destPath = (queryString == null) ? uri : uri + "?" + queryString;
		
		request.getSession().setAttribute("destPath", this.destPath);

	}
}

