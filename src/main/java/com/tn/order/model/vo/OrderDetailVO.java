package com.tn.order.model.vo;


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
public class OrderDetailVO {
	private String orderNo;
	private int qty;
	private String thumbNail;
	private String title;
	private String author;
	private int salePrice;
}
