package com.tn.order.model.vo;

import java.sql.Timestamp;

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
	
	private String thumbNail;
	private String title;
	private String price;
	private String salePrice;
	private String cartQty;
	private String totalPrice;
	private String totalSalePrice;
	private String totalPay;
	private String totalPoint;
	
	

}
