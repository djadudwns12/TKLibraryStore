package com.tn.admin.model.vo;

public enum ResponseType {
	SUCCESS(200), FAIL(400);
	
	private int resultCode;
	
	// enum타입은 접근제어자를 생략해도 default가 아닌 private
	ResponseType(int resultCode) {
		this.resultCode = resultCode;
	}
	
	public int getResultCode() {
		return this.resultCode;
	}
	
	public String getResultMessage() {
		return this.name();		// name은 SUCCESS, FAIL과 같은 이름을 String으로 반환
	}
}