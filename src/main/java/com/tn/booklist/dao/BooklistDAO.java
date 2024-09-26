package com.tn.booklist.dao;

import java.util.List;

import com.tn.booklist.model.dto.PagingInfo;
import com.tn.booklist.model.vo.BooklistVO;

public interface BooklistDAO {
	
	// 전체 책 리스트를 가져오는 메서드 
	List<BooklistVO> selectAllBook(PagingInfo pi) throws Exception;

	// 전체 책의 수를 얻어오는 메서드(검색어 없을 때)
	int getTotalPostCnt() throws Exception;


}