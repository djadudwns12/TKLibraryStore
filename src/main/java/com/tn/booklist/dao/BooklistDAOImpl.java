package com.tn.booklist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tn.booklist.model.dto.PagingInfo;

import com.tn.booklist.model.dto.PagingInfoDTO;

import com.tn.booklist.model.vo.BookDetailInfo;
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

	@Override
	public List<BookDetailInfo> selectAllByBookNo(int bookNo) throws Exception {
		
		return ses.selectList(NS + ".selectBookDetailInfoByBookNo", bookNo);
	}
//	====================================================엄영준=============================================================

	@Override
	public List<BooklistVO> selectCategoryBooklist(PagingInfo pi, String category)  throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
				
		params.put("startRowIndex", pi.getStartRowIndex());
		params.put("viewPostCntPerPage", pi.getViewPostCntPerPage());
		params.put("category", category+"%");
		
		return ses.selectList(NS + ".selectCategoryBooklist", params);
	}

	@Override
	public int countCategoryBooklist(String category) throws Exception {
		
		return ses.selectOne(NS+".countCategoryBooklist",category);
	}

//	====================================================엄영준 END=============================================================
}
