package com.tn.order.model.vo;



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
public class AddressVO {
	// -------- 박근영 --------
	private String receiver_name;
	private String address_key;
	private String receiver_phone;
	private String address;
	private String isDefault;
	private String request;
	// -------- 박근영 --------
	

}
