package com.tn.cart.model.vo;

import lombok.Builder;

public class MyResponseWithData<T> {
	private int resultCode;
	private String resultMessage;
	private T data; // 실행할 때 데이터 타입을 결정하겠다.

	@Builder // 생성자 위에 사용하는 Builder annotation : 아래의 생성자가 가지고 있는 변수를 builder 패턴으로 만들어준다.
	public MyResponseWithData(ResponseType responseType, T data) {
		this.resultCode = responseType.getResultCode();
		this.resultMessage = responseType.getResultMessage();
		this.data = data;
	}
	
	
	public static MyResponseWithData success() {
		return MyResponseWithData.builder()
				.responseType(ResponseType.SUCCESS)
				.build();
	}
	
	public static <T> MyResponseWithData<T> success(T data) { // generic 타입을 사용하는 메소드이기 때문에 genric 타입을 선언해줘야 한다.
		return new MyResponseWithData<>(ResponseType.SUCCESS, data);
	}
	
	public static MyResponseWithData fail() {
		return MyResponseWithData.builder()
				.responseType(ResponseType.FAIL)
				.build();
	}

}
