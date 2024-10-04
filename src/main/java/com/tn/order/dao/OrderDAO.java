package com.tn.order.dao;

import java.util.List;

import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;
import com.tn.order.model.vo.OrderVO;

public interface OrderDAO {

	List<BooklistVO> selectOrderList(MemberDTO loginMember)throws Exception;

}
