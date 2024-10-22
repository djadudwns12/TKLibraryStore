package com.tn.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

//@Builder		// 클래스 위에 사용하는 @Builder 어노테이션은 이 클래스가 가지는 모든 멤버변수를 builder패턴으로 만들어준다
//@AllArgsConstructor

@Getter
public class MyResponseWithData<T> {
	private int resultCode;
	private String resultMessage;
	private T data;
	
	@Builder	// 생성자 위에 사용하는 @Builder 어노테이션은 아래의 생성자가 가지고 있는 변수를 builder 패턴으로 만들어준다
	public MyResponseWithData(ResponseType responseType, T data) {
		this.resultCode = responseType.getResultCode();
		this.resultMessage = responseType.getResultMessage();
		this.data = data;
	}
	
	
	/**
	 * @작성자 : 802-17
	 * @작성일 : 2024. 8. 16.
	 * @메서드명 : success
	 * @return : MyResponseWithData
	 * @throws :
	 * @description :  data없이 성공했다는 코드(200)와 "success"만 전송
	 */
	public static MyResponseWithData success() {
		return MyResponseWithData.builder()
				.responseType(ResponseType.SUCCESS)
				.build();
	}
	
	/**
	 * @작성자 : 802-17
	 * @작성일 : 2024. 8. 16.
	 * @메서드명 : success
	 * @param : 제너릭 타입의 json으로 만들어 줄 data
	 * @return : MyResponseWithData<T>
	 * @throws :
	 * @description : data + 성공했을때 성공 코드(200)와 "success"전송   
	 */
	public static <T> MyResponseWithData<T> success(T data){
		return new MyResponseWithData<>(ResponseType.SUCCESS, data);
	}
	
	/**
	 * @작성자 : 802-17
	 * @작성일 : 2024. 8. 16.
	 * @메서드명 : fail
	 * @return : MyResponseWithData
	 * @throws :
	 * @description : 실패했다는 코드(400)과 "fail" 전송  
	 */
	public static MyResponseWithData fail() {
		return MyResponseWithData.builder()
				.responseType(ResponseType.FAIL)
				.build();
	}
	
}
