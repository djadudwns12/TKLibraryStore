package com.tn.booklist.service;

import java.util.List;
import java.util.Map;

import com.tn.booklist.model.dto.PagingInfoDTO;
import com.tn.booklist.model.vo.BookDetailInfo;
import com.tn.booklist.model.vo.BooklistVO;

public interface BooklistService {

	// 책 전체 리스트 가져오기
	public Map<String, Object> getAllBooklist(PagingInfoDTO dto) throws Exception;

	public List<BookDetailInfo> read(int bookNo, String ipAddr) throws Exception;
	

	
}
