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
	private String totalPrice;
	private String totalSalePrice;
	private String totalPay;
	private String totalPoint;
	private List<String> cartIds;
}
