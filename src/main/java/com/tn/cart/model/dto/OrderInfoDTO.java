package com.tn.cart.model.dto;

import java.util.List;

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
public class OrderInfoDTO {
	private int totalPrice;
	private int totalSalePrice;
	private int totalPay;
	private int totalPoint;
	private List<Integer> bookNos;
	
}
