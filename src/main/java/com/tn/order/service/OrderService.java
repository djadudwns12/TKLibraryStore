package com.tn.order.service;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;
import com.tn.order.model.vo.OrderVO;

/**
 * Handles requests for the application home page.
 */
public interface OrderService {

	
	/**
	 * @작성자 : 엄영준 
	 * @작성일 : 2024. 10. 4. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : getOrderList
	 * @param
	 * @param
	 * @return : List<OrderVO>
	 * @throws 
	 * @description : 회원이 주문한 목록을 불러오는 메서드
	 *
	 */
	List<BooklistVO> getOrderList(MemberDTO loginMember) throws Exception;
		
}
