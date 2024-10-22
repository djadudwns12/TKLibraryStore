package com.tn.cart.model.vo;

import lombok.Builder;

public class MyResponseWithData<T> {
	private int resultCode;
	private String resultMessage;
	private T data; // ������ �� ������ Ÿ���� �����ϰڴ�.

	@Builder // ������ ���� ����ϴ� Builder annotation : �Ʒ��� �����ڰ� ������ �ִ� ������ builder �������� ������ش�.
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
	
	public static <T> MyResponseWithData<T> success(T data) { // generic Ÿ���� ����ϴ� �޼ҵ��̱� ������ genric Ÿ���� ��������� �Ѵ�.
		return new MyResponseWithData<>(ResponseType.SUCCESS, data);
	}
	
	public static MyResponseWithData fail() {
		return MyResponseWithData.builder()
				.responseType(ResponseType.FAIL)
				.build();
	}

}
