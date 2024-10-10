package com.tn.order.model.dto;

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
public class OrderDTO {
	
	private int orderPK;
	private Timestamp orderDate;
	private String orderStatus;
	private String orderWho;
	private int usePoint;
	private int bookNo;
	private int qty;
	private int totalPay;
	private String orderNo;
	
	
	
}