package com.tn.admin.model.vo;

import java.security.Timestamp;
import java.sql.Date;

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
public class RestockVO {
	
	private String restockNo;
	private String title;
	private String author;
	private String image;
	private String timestamp;
}
