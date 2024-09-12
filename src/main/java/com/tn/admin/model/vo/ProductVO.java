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
public class ProductVO {
	private int bookNo;
	private String title;
	private String author;
	private String publisher;
	private Date pubDate;
	private int genre;
	private int price;
	private int salePrice;
	private int inven;
	private String thumbNail;
	private String introduction;
	private int zzim;
	private int reviewCnt;
}
