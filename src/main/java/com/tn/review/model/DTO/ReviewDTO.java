package com.tn.review.model.DTO;

import java.sql.Date;

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
public class ReviewDTO {
	private int reviewNo;
	private String reviewWriter;
	private String reviewContent;
	private Date reviewDate;
	private int reviewScore;
	private int bookNo;
	

}
