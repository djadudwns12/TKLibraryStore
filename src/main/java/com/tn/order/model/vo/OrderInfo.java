package com.tn.order.model.vo;


import java.time.LocalDate;
import java.util.List;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@ToString
@Builder
public class OrderInfo {
	
	private List<String> thumbNail;   // 여러 개의 썸네일을 리스트로 변경
    private List<String> title;       // 여러 개의 책 제목을 리스트로 변경
    private List<String> price;       // 여러 개의 가격을 리스트로 변경
    private List<String> salePrice;   // 여러 개의 할인가를 리스트로 변경
    private List<String> cartQty;     // 여러 개의 수량을 리스트로 변경
    private String totalPrice;
    private String totalSalePrice;
    private String totalPay;
    private String totalPoint;
	private AddressVO defaultAddress;
	private List<AddressVO> address;
	private int userPoint;
	private String arrivalDate;
	private String storeId;
	private String channelKey;
	private String orderName;
	private String paymentId;
	

}
