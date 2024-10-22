package com.tn.category.model.vo;

import com.tn.member.model.vo.MemberVO;

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
public class CategoryVO {
	private String  genreCode;
	private String  genreName;
	private String  parentCode;
}
