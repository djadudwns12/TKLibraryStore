package com.tn.cart.model.dto;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class CartDTO {
	private int bookNo;
	private String userId;
	private int qty;
	
	private String title;
	private int price;
    private int salePrice;
    private String thumbNail;
}
