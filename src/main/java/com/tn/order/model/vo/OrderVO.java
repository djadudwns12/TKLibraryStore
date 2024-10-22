package com.tn.order.model.vo;

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
public class OrderVO {
	
	private int orderPK;
	private Timestamp orderDate;
	private String orderStatus;
	private String orderWho;
	private String orderAddress;
	private int usePoint;
	private int bookNo;
	private int qty;
	private int totalPay;
	private String orderNo;
	private int plannedPoint;
	
	private String title; // 조인으로 Board테이블에서 가져온 책제목
	
}
