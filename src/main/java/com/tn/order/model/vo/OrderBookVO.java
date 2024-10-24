package com.tn.order.model.vo;

import java.sql.Date;

import com.tn.booklist.model.vo.BooklistVO;

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
public class OrderBookVO {
	private int orderBookPK;
	private String orderNo;
	private int bookNo;
	private int qty;
	private Date orderDate;
	
	private BooklistVO booklistVO;
	
}
