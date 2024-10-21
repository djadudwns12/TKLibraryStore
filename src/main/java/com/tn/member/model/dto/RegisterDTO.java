package com.tn.member.model.dto;

import java.time.LocalDate;
import java.util.List;



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
public class RegisterDTO {
	// 박근영//
	private String userId;
	private String password;
	private String userName;
	private String phone;
	private String email;
	private String birthday;
	private String keyword;
	private String addressDetail;
	// 박근영 //
	

}
