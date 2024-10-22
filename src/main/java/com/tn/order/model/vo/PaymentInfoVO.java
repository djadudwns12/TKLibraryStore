package com.tn.order.model.vo;



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
public class PaymentInfoVO {
	// -------- 박근영 --------
	private int bookNo;
	private String qty;
	private String orderNo;
	private String orderPK;
	private int userTotalPay;
	// -------- 박근영 --------
	

}
