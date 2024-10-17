package com.tn.review.model.DTO;

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
public class ReviewDTO {
	private int reviewId;
	private Timestamp reviewDate;
	private String reviewWriter;
	private String reviewContent;
	private int reviewScore;
	private int bookNo;
	

}
