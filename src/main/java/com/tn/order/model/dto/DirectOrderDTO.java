package com.tn.order.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class DirectOrderDTO {
	
	private int bookNo;
	private String thumbNail;
	private String title;
	private int price;
	private int salePrice;
	private int totalQty;
	private int totalPrice;
	private int totalSalePrice;
	private int totalPay;
	private int totalPoint;
	private String userId;
	


}
