package com.tn.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;
import com.tn.order.model.vo.OrderVO;
@Repository
public class OrderDAOImpl implements OrderDAO {
	
	private static final String NS = "com.tn.mapper.orderMapper";
	
	@Autowired
	private SqlSession sess;

	@Override
	public List<BooklistVO> selectOrderList(MemberDTO loginMember) throws Exception {
		
		return sess.selectList(NS+".selectOrderList", loginMember);
	}
	
}
