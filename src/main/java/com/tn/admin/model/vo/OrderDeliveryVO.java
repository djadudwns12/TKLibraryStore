package com.tn.admin.model.vo;

import java.sql.Date;
import java.sql.Timestamp;
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
public class OrderDeliveryVO {
	private String orderDate;
	private String orderStatus;
	private String orderWho;
	private String orderAddress;
	private int usePoint;
	private int totalPay;
	private String orderName;
	private List<OrderBookVO> orderBooks;
}
