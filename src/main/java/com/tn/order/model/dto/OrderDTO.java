package com.tn.order.model.dto;

import java.util.List;

import com.tn.member.model.vo.ImgFileVODTO;

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
public class OrderDTO {
	// ------ 박근영 ---------
	private String totalPrice;
	private String totalSalePrice;
	private String totalPay;
	private String totalPoint;
	private List<String> cartIds;
	// ------ 박근영 ---------
	

}
