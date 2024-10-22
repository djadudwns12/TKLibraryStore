package com.tn.member.model.dto;

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
public class MemberDTO {
	private String userId;
	private String userPwd;
	private String userName;
	private java.sql.Date userBirth;
	private String phoneNum;
	private String email;
	private int userPoint;
	private String userImg;
	private String base64ProfileImg;
	
}
