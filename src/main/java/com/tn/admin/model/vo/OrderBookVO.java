package com.tn.admin.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

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
public class OrderBookVO {
	private String orderNo;
	private String bookNo;
	private int Qty;
	private String thumbNail;
	
}