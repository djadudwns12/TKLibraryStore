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
public class MyAddressDTO {
	private int addressId;
    private String userId;
    private String address;
	private String receiver_name;
	private String address_key;
	private String receiver_phone;
	private String isDefault;
	private String request;
	
	// 얘네 합쳐서 address 컬럼에 insert
	private String keyword;
	private String addressDetail;
}
