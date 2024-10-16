package com.tn.member.model.vo;

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
public class MyAddressVO {
	
	private int addressId;
	private String userId;
	private String receiver_name;
	private String address_key;
	private String receiver_phone;
	private String address;
	private String isDefault; // N일 때 기본 배송지 Y일 때 일반 배송지
	private String request;
	
}
