package com.tn.review.model.VO;

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
public class ReviewVO {
	
	private int reviewNo;
	private String reviewWriter;
	private String reviewContent;
	private Timestamp reviewDate;
	private int reviewScore;
	private int bookNo;
	
	// BookList에서 조인문으로 참조하여 가져오는 내용
	private String title;
	private String thumbNail;
}
