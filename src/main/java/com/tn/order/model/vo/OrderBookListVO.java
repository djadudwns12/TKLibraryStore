package com.tn.order.model.vo;

import java.util.List;

import com.tn.order.model.dto.OrderDTO;

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
public class OrderBookListVO {
	
	private String title;
	private int price;
	private int salePrice;
	private String thumbNail;

}
