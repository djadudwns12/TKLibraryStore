package com.tn.booklist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.booklist.model.dto.PagingInfo;
import com.tn.booklist.model.vo.BooklistVO;

@Repository
public class BooklistDAOImpl implements BooklistDAO {
	
	@Autowired
	private SqlSession ses;
	
	private static String NS = "com.tn.mappers.bookMapper";

	@Override
	public List<BooklistVO> selectAllBook(PagingInfo pi) throws Exception {
		
		return ses.selectList(NS + ".getAllBooklist", pi);
	}

	@Override
	public int getTotalPostCnt() throws Exception {
		
		return ses.selectOne(NS + ".selectTotalCnt");
	}

}
