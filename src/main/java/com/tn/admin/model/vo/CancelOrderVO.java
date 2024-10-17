package com.tn.admin.model.vo;

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
public class CancelOrderVO {
	private String orderWho; 
	private int usePoint;
	private int totalPay;
	private String orderPK;
}
