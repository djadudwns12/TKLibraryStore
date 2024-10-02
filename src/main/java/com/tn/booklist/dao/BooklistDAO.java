package com.tn.booklist.dao;

import java.util.List;

import com.tn.booklist.model.dto.PagingInfo;
import com.tn.booklist.model.vo.BookDetailInfo;
import com.tn.booklist.model.vo.BooklistVO;

public interface BooklistDAO {
	
	// 전체 책 리스트를 가져오는 메서드 
	List<BooklistVO> selectAllBook(PagingInfo pi) throws Exception;

	// 전체 책의 수를 얻어오는 메서드(검색어 없을 때)
	int getTotalPostCnt() throws Exception;

	// 책의 상세정보를 얻어오는 메서
	List<BookDetailInfo> selectAllByBookNo(int bookNo) throws Exception;

	//	====================================================엄영준=============================================================
	// 책을 카테고리 리스트로 받아오는 메서드
	List<BooklistVO> selectCategoryBooklist(PagingInfo pi, String category) throws Exception;
	// 카테고리 적용시 개수를 받아오는 메서드
	int countCategoryBooklist(String category) throws Exception;
//	====================================================엄영준 END=============================================================


}
