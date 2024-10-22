package com.tn.order.model.dto;

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
@Setter
@Getter
@Builder
@ToString
public class PaymentInfoDTO {
   // ------ 박근영 ---------
   private String totalAmount;
   private String remainingPoint;
   private String finalInputPoint;
   private String paymentId;
   private String orderName;
   private List<String> titleName;
   private String userId;
   private List<String> cartId;
   private String address;
   private String totalPoint;
   private List<String> bookQty;
   private int orderPK;
   private int userTotalPay;
   // ------ 박근영 ---------

}
