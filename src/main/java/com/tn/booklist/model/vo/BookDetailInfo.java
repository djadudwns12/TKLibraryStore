package com.tn.booklist.model.vo;

import java.sql.Timestamp;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Setter
@Getter
@ToString
public class BookDetailInfo {
	private int bookNo;
	private String title;
	private String author;
	private String publisher;
	private Timestamp pubDate;
	private String genre;
	private int price;
	private int salePrice;
	private int inven;
	private String thumbNail;
	private String introduction;
	private int zzim;
	private int reviewCnt;
	
	private String base64ProFileImg;
	
	private String userId;
	private String address;
	private String isDefault;
	
	private int pWhy;
	private int pScore;
	
	private int reviewNo;
	private String reviewWriter;
	private String reviewContent;
	private Timestamp reviewDate;
	private int reviewScore;
	
	private int rLikeNo;
	private int rLikeCnt;
	
}
