package com.tn.member.model.vo;


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
public class ImgFileVODTO {
	// -------- 박근영 --------
	private String newFileName;
	private String base64Img;
	// -------- 박근영 --------
}
